
class WcoHosting::LeadsetsController < WcoHosting::ApplicationController

  before_action :set_lists

  def index
    authorize! :index, Wco::Leadset
    @leadsets = Wco::Leadset.all
  end

  def show
    @leadset = Wco::Leadset.find params[:id]
    authorize! :show, @leadset

  end

  def update
    @leadset = Wco::Leadset.find params[:id]
    authorize! :update, @leadset
    params[:leadset][:serverhost_ids].delete("")
    puts! params, 'params'

    flag = @leadset.update_attributes( params.require(:leadset).permit(
      :company_url, :email, serverhost_ids: [] )
    )
    if flag
      flash_notice @leadset
    else
      flash_alert @leadset
    end
    redirect_to action: :index
  end

  ##
  ## private
  ##
  private

  def set_lists
    @serverhosts_list = WcoHosting::Serverhost.list
  end


end
