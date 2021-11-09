Rails.application.routes.draw do
  devise_for :users
# root to: event_index_path

resources :user

  resources :event
  get 'event/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
