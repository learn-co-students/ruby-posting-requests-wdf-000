Rails.application.routes.draw do
  root 'searches#search'
  get '/search', to: 'searches#search'
  post '/search', to: 'searches#foursquare'

  get '/auth', to: 'sessions#create'
  get '/friends', to: 'searches#friends'

  # route for our tips form to POST to, and a route to see our tips after we've added them
  resources :tips, only: [:index, :create]

end
