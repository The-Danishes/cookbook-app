Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "recipes#index"
  get "/recipes", to: "recipes#index"

  get "/recipes/new", to: "recipes#new"
  post "/recipes", to: "recipes#create"

  get "/recipes/:id/edit", to: "recipes#edit"
  patch "/recipes/:id", to: "recipes#update"

  get "/recipes/:id", to: "recipes#show"

  delete "/recipes/:id", to: "recipes#destroy"

  post "/search", to: "recipes#search"

  get "/signup", to: 'users#new'
  post "/users", to: 'users#create'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


end
