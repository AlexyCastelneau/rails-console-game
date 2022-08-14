Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get "profile", to: "profiles#show"
  get "game", to: "games#run"
  get "play", to: "games#play"
  resources :persos, only: [:index, :show, :new, :create, :destroy]

end
