
WcoHosting::Engine.routes.draw do
  root to: '/wco_hosting/application#home'

  resources :appliance_tmpls
  resources :appliances

  resources :domains

  # get 'email_conversations/in/:tagname',         to: '/wco/email_conversations#index', as: :email_conversations_in
  # get 'email_conversations/not-in/:tagname_not', to: '/wco/email_conversations#index', as: :email_conversations_in_not
  # resources :email_conversations

  # resources :leadsets

  resources :serverhosts

end
