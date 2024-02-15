
class WcoHosting::AppliancesController < WcoHosting::ApplicationController

  def index
    authorize! :index, WcoHosting::Appliance
    @appliances = WcoHosting::Appliance.all
  end

  def edit
    @appliance = WcoHosting::Appliance.find params[:id]
    authorize! :edit, @appliance
  end

  def show
    @appliance = WcoHosting::Appliance.find params[:id]
    authorize! :show, @appliance
  end

  # def update
  #   @serverhost = WcoHosting::Serverhost.find params[:id]
  #   authorize! :update, @serverhost
  #   if @serverhost.update_attributes( params[:serverhost].permit! )
  #     flash_notice @serverhost
  #   else
  #     flash_alert @serverhost
  #   end
  #   redirect_to action: :index
  # end


end
