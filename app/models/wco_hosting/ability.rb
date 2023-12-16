# frozen_string_literal: true

require 'cancancan'

class WcoHosting::Ability
  include ::CanCan::Ability

  def initialize(user)

    if user

      if [ 'piousbox@gmail.com', 'victor@piousbox.com', 'victor@wasya.co' ].include? user.email
        can :manage, :all
      end

    end

  end
end
