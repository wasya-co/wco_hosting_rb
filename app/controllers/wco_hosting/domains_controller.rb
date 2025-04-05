
class WcoHosting::DomainsController < WcoHosting::ApplicationController

  def create
    @domain = WcoHosting::Domain.new params[:domain].permit!
    authorize! :create, @domain

    if @domain.save
      flash_notice @domain
    else
      flash_alert @domain
    end

    redirect_to action: :index
  end

  def edit
    @domain = WcoHosting::Domain.find params[:id]
    authorize! :edit, @domain
  end

  def index
    authorize! :index, WcoHosting::Domain
    @domains = WcoHosting::Domain.all
  end


  def new
    @domain = WcoHosting::Domain.new
    authorize! :new, @domain
  end

  def show
    @domain = WcoHosting::Domain.find params[:id]
    authorize! :show, @domain
    @subdomains = WcoHosting::Appliance.where( domain: @domain.name ).map( &:subdomain )
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
