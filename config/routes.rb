Rails.application.routes.draw do
  root 'fighters#index'
  resources :fighters, except: [:update, :delete]
end
