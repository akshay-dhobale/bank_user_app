Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  post "sign-up", to: "users#create"
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  post "/create-account", to: 'accounts#create'
  get '/get-details', to: 'accounts#get_details'

  post '/transaction/:txn_type', to: 'transactions#create'#, constraints: lambda { |request| }
  # post '/withdraw-money', to: 'transactions#create'
end
