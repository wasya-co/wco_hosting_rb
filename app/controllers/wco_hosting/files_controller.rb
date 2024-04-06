
class WcoHosting::FilesController < WcoHosting::ApplicationController

  def create
    @file = WcoHosting::File.new params[:file].permit!
    authorize! :create, @file

    flag = @file.save
    if flag
      flash[:notice] = 'Success.'
      redirect_to action: :index
    else
      flash[:alert] = "Cannot create file: #{@file.errors.full_messages.join(', ')}."
      render action: :index
    end
  end

  def edit
    @file = WcoHosting::File.find params[:id]
    authorize! :edit, @file

    @serverhost = @file.serverhost
  end

  def index
    authorize! :index, WcoHosting::File
    @files = WcoHosting::File.all
    @new_file = WcoHosting::File.new
  end

  def new
    authorize! :index, WcoHosting::File
    @new_file = WcoHosting::File.new
  end

  def show
    @file = WcoHosting::File.find params[:id]
    authorize! :show, @file
  end

  def update
    @file = WcoHosting::File.find params[:id]
    authorize! :update, @file
    if @file.update_attributes( params[:file].permit! )
      flash_notice @file
    else
      flash_alert @file
    end
    redirect_to request.referrer
  end

  ##
  ## private
  ##
  private

  def set_lists
    @appliances_list = WcoHosting::Appliance.list
  end

end
