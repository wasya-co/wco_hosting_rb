
class WcoHosting::ServerhostsController < WcoHosting::ApplicationController

  def create
    @serverhost = WcoHosting::Serverhost.new params[:serverhost].permit!
    authorize! :create, @serverhost

    flag = @serverhost.save
    if flag
      flash[:notice] = 'Success.'
      redirect_to action: :index
    else
      flash[:alert] = "Cannot create serverhost: #{@serverhost.errors.full_messages.join(', ')}."
      render action: :index
    end
  end

  def edit
    @serverhost = WcoHosting::Serverhost.find params[:id]
    authorize! :edit, @serverhost
  end

  def index
    authorize! :index, WcoHosting::Serverhost
    @serverhosts = WcoHosting::Serverhost.all
    @new_serverhost = WcoHosting::Serverhost.new
  end

  def new
    authorize! :index, WcoHosting::Serverhost
    @new_serverhost = WcoHosting::Serverhost.new
  end

  def update
    @serverhost = WcoHosting::Serverhost.find params[:id]
    authorize! :update, @serverhost
    if @serverhost.update_attributes( params[:serverhost].permit! )
      flash_notice @serverhost
    else
      flash_alert @serverhost
    end
    redirect_to action: :index
  end


end
