Rails.application.routes.draw do
  root to: "home#index"
  get 'about', to: "about#index"

  resources :spells, only: [:index, :show]
  resources :character_classes, only: [:index, :show]
end
