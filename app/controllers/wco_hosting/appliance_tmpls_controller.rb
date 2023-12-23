
class WcoHosting::ApplianceTmplsController < WcoHosting::ApplicationController

  before_action :set_lists

  def create
    @appliance_tmpl = WcoHosting::ApplianceTmpl.new params[:appliance].permit!
    authorize! :create, @appliance_tmpl

    flag = @appliance_tmpl.save
    if flag
      flash[:notice] = 'Success.'
      redirect_to action: :index
    else
      flash[:alert] = "Cannot create appliance tmplate: #{@appliance_tmpl.errors.full_messages.join(', ')}."
      redirect_to action: :index
    end
  end

  def edit
    @appliance_tmpl = WcoHosting::ApplianceTmpl.find params[:id]
    authorize! :edit, @appliance_tmpl
  end

  def index
    authorize! :index, WcoHosting::ApplianceTmpl
    @appliance_tmpls = WcoHosting::ApplianceTmpl.all
  end

  def new
    authorize! :index, WcoHosting::ApplianceTmpl
    @appliance_tmpl = WcoHosting::ApplianceTmpl.new
  end

  def update
    @appliance_tmpl = WcoHosting::ApplianceTmpl.find params[:id]
    authorize! :update, @appliance_tmpl
    flag = @appliance_tmpl.update params[:appliance].permit!
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
    @new_appliance_tmpl = WcoHosting::ApplianceTmpl.new
  end

end

