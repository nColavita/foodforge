Rails.application.routes.draw do

  # resources :recipes
  post '/search', to: 'recipes#search'
  get '/search', to: 'recipes#search'
  root 'home#show'

  resources :users
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'

end
