
class WcoHosting::EnvironmentsController < WcoHosting::ApplicationController

  def index
    authorize! :index, WcoHosting::Environment
    @environments = WcoHosting::Environment.all
  end

  def edit
    @environment = WcoHosting::Environment.find params[:id]
    authorize! :edit, @environment
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


end
