
class WcoHosting::TaskTmplsController < WcoHosting::ApplicationController

  def create
    @tmpl = WcoHosting::TaskTmpl.new params[:task_tmpl].permit!
    authorize! :create, WcoHosting::TaskTmpl

    if @tmpl.save
      flash_notice @tmpl
    else
      flash_alert @tmpl
    end

    redirect_to request.referrer
  end

  def destroy
  end

  def edit
  end

  def index
    authorize! :index, WcoHosting::TaskTmpl
    @task_tmpls = WcoHosting::TaskTmpl.all
  end

  def new
    authorize! :new, WcoHosting::TaskTmpl

  end

  def show
  end

  def update
  end

  ##
  ## private
  ##
  private

  def set_lists
    @new_task_tmpl = WcoHosting::TaskTmpl.new
  end

end

