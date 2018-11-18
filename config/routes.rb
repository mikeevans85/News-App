Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do

    post "/users" => "users#create"

    post "/sessions" => "sessions#create"

    get "/sources" => "sources#index"
    post "/sources" => "usersources#create"
    get "/sources :id" => "sources#show"
    delete "/sources :id" => "usersources#destroy"

    get "/feed" => "usersources#index"

  end
end
