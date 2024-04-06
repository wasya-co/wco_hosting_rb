
WcoHosting::Engine.routes.draw do
  root to: '/wco_hosting/application#home'

  post 'appliance_tmpls/add-tmpl-task', to: 'appliance_tmpls#add_task_tmpl', as: :add_appliance_tmpl_task_tmpl
  get 'appliance_tmpls/deleted', to: 'appliance_tmpls#index', defaults: { deleted: true },  as: :deleted_appliance_tmpls
  get 'appliance_tmpls',         to: 'appliance_tmpls#index', defaults: { deleted: false }, as: :appliance_tmpls
  post 'appliance_tmpls/run-task/:id/:task', to: 'appliance_tmpls#run_task', as: :appliance_tmpl_run_task
  resources :appliance_tmpls
  resources :appliances

  resources :domains

  resources :environments

  resources :files

  # get 'email_conversations/in/:tagname',         to: '/wco/email_conversations#index', as: :email_conversations_in
  # get 'email_conversations/not-in/:tagname_not', to: '/wco/email_conversations#index', as: :email_conversations_in_not
  # resources :email_conversations

  # resources :leadsets

  resources :serverhosts

  resources :task_tmpls
  resources :tasks

end
