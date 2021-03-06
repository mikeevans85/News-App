Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do

    post "/users" => "users#create"

    post "/sessions" => "sessions#create"

    get "/sources" => "sources#index"
    post "/sources" => "usersources#create"
    get "/sources/:id" => "sources#show"
    patch "sources/:id" => "sources#update"
    delete "/sources/:id" => "usersources#destroy"

    get "/feed" => "usersources#index"
    post "/translater" => "usersources#translate"
    patch "/update/" => "usersources#update"

  end
end
