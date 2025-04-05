
class WcoHosting::EnvironmentsController < WcoHosting::ApplicationController

  def create
    @environment = WcoHosting::Environment.new params[:environment].permit!
    authorize! :create, @environment

    if @environment.save
      flash_notice 'success'
    else
      flash_alert @environment
    end

    redirect_to action: :index
  end

  def edit
    @environment = WcoHosting::Environment.find params[:id]
    authorize! :edit, @environment
  end

  def index
    authorize! :index, WcoHosting::Environment
    @environments = WcoHosting::Environment.all
  end


  def new
    authorize! :new, WcoHosting::Environment
    @environment = WcoHosting::Environment.new
  end

  def show
    @environment = WcoHosting::Environment.find params[:id]
    authorize! :show, @environment
    @subenvironments = WcoHosting::Appliance.where( environment: @environment.name ).map( &:subenvironment )
  end

  def update
    @environment = WcoHosting::Environment.find params[:id]
    authorize! :update, @environment
    if @environment.update_attributes( params[:environment].permit! )
      flash_notice @environment
    else
      flash_alert @environment
    end
    redirect_to action: :index
  end

  private

  def set_lists
    @leadsets_list = Wco::Leadset.list
  end

end
