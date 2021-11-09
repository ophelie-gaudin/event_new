Rails.application.routes.draw do
  resources :event
  get 'event/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
