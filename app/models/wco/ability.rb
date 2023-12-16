# frozen_string_literal: true

require 'cancancan'

## v0.0.0
class Wco::Ability
  include ::CanCan::Ability

  def initialize(user)

    if user

      if [ 'piousbox@gmail.com', 'victor@piousbox.com', 'victor@wasya.co' ].include? user.email
        can :manage, :all
      end

    end

  end
end
