Rails.application.routes.draw do

  resources :recipes do
  	member do
  		post '/favorite', to: 'recipes#favorite'
  		post '/unfavorite', to: 'recipes#unfavorite'
  	end
  end
  
  # post '/search', to: 'recipes#search'
  get '/search', to: 'recipes#search'

 
  resources :users

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'

  root 'home#show'

end
