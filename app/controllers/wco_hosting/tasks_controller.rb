
class WcoHosting::TasksController < WcoHosting::ApplicationController

  def create
  end

  def destroy
  end

  def edit
  end

  def index
    authorize! :index, WcoHosting::Task
  end

  def new
    authorize! :new, WcoHosting::Task

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
    @new_task_ = WcoHosting::Task.new
  end

end

