
class WcoHosting::ServerhostsController < WcoHosting::ApplicationController

  def create
    @serverhost = WcoHosting::Serverhost.new params[:serverhost].permit!
    authorize! :create, @serverhost

    @serverhost.do_create_server! unless params[:skip_do_resource]

    flag = @serverhost.save
    if flag
      flash[:notice] = 'Success.'
      redirect_to action: :index
    else
      flash[:alert] = "Cannot create serverhost: #{@serverhost.errors.full_messages.join(', ')}."
      render action: :index
    end
  end

  def destroy
    @serverhost = WcoHosting::Serverhost.find params[:id]
    authorize! :destroy, @serverhost
    out = HTTParty.delete( "https://api.digitalocean.com/v2/droplets/#{@serverhost.do_id}",
      headers: { 'Authorization' => "Bearer #{DO_READER_TOKEN}" },
        :debug_output => $stdout,
      );
    puts! out, 'out'
    flag = @serverhost.destroy!
    if flag
      flash_notice @serverhost
    else
      flash_alert @serverhost
    end
    redirect_to action: :index
  end

  def edit
    @serverhost = WcoHosting::Serverhost.find params[:id]
    authorize! :edit, @serverhost
  end

  def index
    authorize! :index, WcoHosting::Serverhost
    @serverhosts = WcoHosting::Serverhost.all.order_by name: :asc
    @new_serverhost = WcoHosting::Serverhost.new
  end

  def new
    authorize! :index, WcoHosting::Serverhost
    @new_serverhost = WcoHosting::Serverhost.new
  end

  def show
    @serverhost = WcoHosting::Serverhost.find params[:id]
    authorize! :show, @serverhost

    @files = @serverhost.files
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
