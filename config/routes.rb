Rails.application.routes.draw do
  devise_for :users
  # root to: event_index_path

  resources :user

  resources :event

  root 'event#index'
  # met en root (accueil) la view entre guillemet

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
