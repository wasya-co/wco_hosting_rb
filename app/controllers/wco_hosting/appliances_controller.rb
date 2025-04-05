
class WcoHosting::AppliancesController < WcoHosting::ApplicationController

  def index
    authorize! :index, WcoHosting::Appliance
    @appliances = WcoHosting::Appliance.all
  end

  def edit
    @appliance = WcoHosting::Appliance.find params[:id]
    authorize! :edit, @appliance
  end

  def new
    authorize! :new, @new_appliance
  end

  def show
    @appliance = WcoHosting::Appliance.find params[:id]
    authorize! :show, @appliance
  end

  def update
    @appliance = WcoHosting::Appliance.find params[:id]
    authorize! :update, @appliance
    if @appliance.update_attributes( params[:appliance].permit! )
      flash_notice @appliance
    else
      flash_alert @appliance
    end
    redirect_to action: :index
  end

  ##
  ## private
  ##
  private

  def set_lists
    @appliance_tmpls_list = WcoHosting::ApplianceTmpl.list
    @environments_list = WcoHosting::Environment.list
    @new_appliance = WcoHosting::Appliance.new
  end

end
