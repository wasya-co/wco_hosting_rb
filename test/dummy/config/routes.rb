
Rails.application.routes.draw do
  root to: 'application#home'
  # root to: redirect('/email')

  mount Wco::Engine        => "/wco"
  mount WcoHosting::Engine => "/hosting"


  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  resources :users

end
