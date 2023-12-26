
class WcoHosting::SubscriptionsController < WcoHosting::ApplicationController

  def create
    Stripe::Subscription.create({
      customer: 'cus_Na6dX7aXxi11N4',
      items: [{price: 'price_1MowQULkdIwHu7ixraBm864M'}],
    })
  end

end
