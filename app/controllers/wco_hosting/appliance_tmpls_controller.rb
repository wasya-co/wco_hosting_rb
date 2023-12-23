
class WcoHosting::ApplianceTmplsController < WcoHosting::ApplicationController
  def index
    authorize! :index, WcoHosting::ApplianceTmpl
    @appliance_tmpls = WcoHosting::ApplianceTmpl.all
  end
end
