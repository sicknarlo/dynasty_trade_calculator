Rails.application.routes.draw do
  root to: 'search#calculator'

  get "results", to: 'search#results'
end
