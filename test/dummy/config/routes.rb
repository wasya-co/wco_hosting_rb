Rails.application.routes.draw do
  mount WcoEmail::Engine => "/wco_email"
end
