
class WcoHosting::ApplicationController < ActionController::Base

  check_authorization

  def home
    authorize! :index, ::WcoHosting::Appliance
  end

  ##
  ## private
  ##
  private

  def current_ability
    @current_ability ||= ::Wco::Ability.new(current_user)
  end

  def current_profile
    @current_profile ||= Wco::Profile.find_by( email: current_user.email )
  end

  def current_leadset
    @current_leadset ||= current_profile.leadset
  end

end
