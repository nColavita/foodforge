Rails.application.routes.draw do

  # resources :recipes
  post '/search', to: 'recipes#search'
  get '/search', to: 'recipes#search'
  root 'home#show'

end
