Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"

  # user related routes
  resources :users, only:[:create, :edit, :show, :update]

  get "/sign_up" => "users#new", as: "sign_up"

  get "/login" => "sessions#new", as: "login"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy", as: "logout"

  # post and reservation related routes
  resources :duties do
    resources :reservations
  end

end
