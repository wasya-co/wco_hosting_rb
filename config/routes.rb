
WcoEmail::Engine.routes.draw do
  root to: 'application#home'

  resources :email_conversations

end
