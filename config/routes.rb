Rails.application.routes.draw do
  resources :fighters, except: [:update, :delete]
end
