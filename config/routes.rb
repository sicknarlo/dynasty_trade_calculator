Rails.application.routes.draw do
  # root to: 'static_pages#landing'

  root to: "static_pages#landing"

  get "calculator", to: "search#calculator"
  get "results", to: 'search#results'

  resources :players
  get "database", to: "players#database"

end
