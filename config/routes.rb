Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "recipes#home"

  get "/new_recipe", to: "recipes#new"
  post "/recipe_saved", to: "recipes#save"

end
