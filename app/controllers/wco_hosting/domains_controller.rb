
class WcoHosting::DomainsController < WcoHosting::ApplicationController

  def index
    authorize! :index, WcoHosting::Domain
    @domains = WcoHosting::Domain.all
  end

  def edit
    @domain = WcoHosting::Domain.find params[:id]
    authorize! :edit, @domain
  end

  def update
    @domain = WcoHosting::Domain.find params[:id]
    authorize! :update, @domain
    if @domain.update_attributes( params[:domain].permit! )
      flash_notice @domain
    else
      flash_alert @domain
    end
    redirect_to action: :index
  end


end
