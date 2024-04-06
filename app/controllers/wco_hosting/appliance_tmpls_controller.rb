
class WcoHosting::ApplianceTmplsController < WcoHosting::ApplicationController

  before_action :set_lists

  def add_task_tmpl
    @appliance_tmpl = WcoHosting::ApplianceTmpl.find params[:id]
    authorize! :edit, @appliance_tmpl
    @appliance_tmpl.task_tmpls.push WcoHosting::TaskTmpl.find( params[:task_tmpl_id] )
    if @appliance_tmpl.save
      flash_notice @appliance_tmpl
    else
      flash_alert @appliance_tmpl
    end
    redirect_to request.referrer
  end

  def create
    # params[:tmpl][:leadset_ids].delete ''

    @appliance_tmpl = WcoHosting::ApplianceTmpl.new params[:tmpl].permit!
    authorize! :create, @appliance_tmpl

    flag = @appliance_tmpl.save
    if flag
      flash[:notice] = 'Success.'
    else
      flash[:alert] = "Cannot create appliance tmplate: #{@appliance_tmpl.errors.full_messages.join(', ')}."
    end

    redirect_to appliance_tmpls_path
  end

  def destroy
    @appliance_tmpl = WcoHosting::ApplianceTmpl.find params[:id]
    authorize! :destroy, @appliance_tmpl
    flag = @appliance_tmpl.delete
    if flag
      flash_notice 'ok'
    else
      flash_alert @appliance_tmpl
    end
    redirect_to action: 'index'
  end

  def edit
    @appliance_tmpl = WcoHosting::ApplianceTmpl.unscoped.find params[:id]
    authorize! :edit, @appliance_tmpl
  end

  def index
    authorize! :index, WcoHosting::ApplianceTmpl
    @appliance_tmpls = WcoHosting::ApplianceTmpl.all
    if params[:deleted]
      @appliance_tmpls = WcoHosting::ApplianceTmpl.unscoped.deleted
    end
  end

  def new
    authorize! :index, WcoHosting::ApplianceTmpl
    @appliance_tmpl = WcoHosting::ApplianceTmpl.new
  end

  def run_task
    @appliance_tmpl = WcoHosting::ApplianceTmpl.find params[:id]
    @tmpl           = @appliance_tmpl
    authorize! :run_task, @appliance_tmpl

    @appliance = WcoHosting::Appliance.where( id: params[:appliance_id] ).first
    rc_json = JSON.parse @appliance.rc_json

    case params[:task]
    when WcoHosting::Runner::TASK_REDEPLOY_ECS_TASK_DEFINITION

      template = ERB.new( @appliance_tmpl.ecs_task_definition_erb )
      file = Tempfile.new('prefix')
      rendered_str = template.result(binding)
      puts! rendered_str, 'rendered_str'
      file.write rendered_str
      file.close
      out = WcoHosting::Runner.do_exec <<~AOL
        aws ecs register-task-definition \
          --cli-input-json file:///#{file.path} \
          --profile ecs_driver_1
      AOL

      if out[:stdout].present?
        Wco::Log.puts! out[:stdout], 'stdout', obj: @appliance_tmpl
      end
      if out[:stderr].present?
        Wco::Log.puts! out[:stderr], 'stderr', obj: @appliance_tmpl
      end

    when WcoHosting::Runner::TASK_REDEPLOY_ECS_TASK

      out = WcoHosting::Runner.do_exec <<~AOL
        aws ecs update-service --service #{@appliance_tmpl.kind} \
          --task-definition #{@appliance_tmpl.kind} \
          --cluster fragile-cluster \
          --enable-execute-command \
          --force-new-deployment \
          --profile ecs_driver_1
      AOL

      if out[:stdout].present?
        Wco::Log.puts! out[:stdout], 'stdout', obj: @appliance
      end
      if out[:stderr].present?
        Wco::Log.puts! out[:stderr], 'stderr', obj: @appliance
      end

    when WcoHosting::Runner::TASK_SYNC_ECS_TASK

      out = WcoHosting::Runner.do_exec <<~AOL
        aws ecs list-tasks \
          --cluster fragile-cluster \
          --service #{@appliance_tmpl.kind} \
          --profile ecs_driver_1
      AOL
      out     = JSON.parse out[:stdout]
      task_id = out['taskArns'][0].split('/').last
      puts! task_id, 'task_id'
      rc_json[:task_id] = task_id

      out = WcoHosting::Runner.do_exec <<~AOL
        aws ecs describe-tasks --cluster fragile-cluster \
          --tasks arn:aws:ecs:us-east-2:831556125887:task/fragile-cluster/#{task_id} \
          --profile ecs_driver_1
      AOL
      out = JSON.parse out[:stdout]
      eni_id = out['tasks'][0]['attachments'][0]['details'].select { |d|
        d['name'] == 'networkInterfaceId'
      }[0]['value']
      puts! eni_id, 'eni_id'
      rc_json[:eni_id] = eni_id

      out = WcoHosting::Runner.do_exec <<~AOL
        aws ec2 describe-network-interfaces \
          --network-interface-id #{eni_id} \
          --profile ecs_driver_1
      AOL
      out = JSON.parse out[:stdout]
      public_ip = out['NetworkInterfaces'][0]['Association']['PublicIp']
      puts! public_ip, 'public_ip'
      rc_json[:public_ip] = public_ip
      rc_json[:ip_addr]   = out['NetworkInterfaces'][0]['PrivateIpAddress']

      @appliance.update({ rc_json: rc_json })

    end


    flash[:notice] = "Status: #{out[:status]}"
    redirect_to  request.referrer
  end

  def show
    @appliance_tmpl = WcoHosting::ApplianceTmpl.find params[:id]
    authorize! :show, @appliance_tmpl
  end

  def update
    # params[:tmpl][:leadset_ids].delete ''

    @appliance_tmpl = WcoHosting::ApplianceTmpl.find params[:id]
    authorize! :update, @appliance_tmpl

    # price = Wco::Price.find( params[:tmpl][:price] )
    # price.product = @appliance_tmpl
    # price.save

    # params[:tmpl][:price_id] = price.price_id
    # params[:tmpl][:price] = price

    flag = @appliance_tmpl.update params[:tmpl].permit!
    if flag
      flash_notice 'success'
    else
      flash_alert "Cannot update appliance template: #{@appliance_tmpl.errors.full_messages.join(', ')}."
    end
    redirect_to action: :index
  end

  ##
  ## private
  ##
  private

  def set_lists
    @leadsets      = Wco::Leadset.all
    @leadsets_list = Wco::Leadset.list
    @new_appliance_tmpl = WcoHosting::ApplianceTmpl.new
    @task_tmpls_list = WcoHosting::TaskTmpl.list
    # @profiles_list = Wco::Profile.list
  end

end

