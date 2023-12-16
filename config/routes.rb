
WcoEmail::Engine.routes.draw do
  root to: 'application#home'

  get 'email_conversations/in/:tagname',         to: '/wco/email_conversations#index', as: :email_conversations_in
  get 'email_conversations/not-in/:tagname_not', to: '/wco/email_conversations#index', as: :email_conversations_in_not

  resources :email_conversations

end
