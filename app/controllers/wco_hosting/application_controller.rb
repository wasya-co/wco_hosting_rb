
require 'ish_models'

class WcoHosting::ApplicationController < ActionController::Base

  check_authorization

  def home
    authorize! :index, ::Wco::EmailConversation
  end

  ##
  ## private
  ##
  private

  def current_ability
    @current_ability ||= ::WcoHosting::Ability.new(current_user)
  end

  def current_profile
    @current_profile ||= Wco::Profile.find_by( email: current_user.email )
  end

end
