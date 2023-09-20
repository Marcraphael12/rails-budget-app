Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "groups#index", as: "moneytrack"

  resources :groups, only: [:new, :show, :create] do
    resources :money_tracks, only: [:new, :show, :create]
  end
end
