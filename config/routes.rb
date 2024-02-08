Rails.application.routes.draw do
  root to: "home#index"
  get 'about', to: "about#index"

  resources :spells, only: [:index, :show] do
    collection do
      get "search"
    end
  end

  resources :character_classes, only: [:index, :show]
  resources :schools, only: [:index, :show]
end
