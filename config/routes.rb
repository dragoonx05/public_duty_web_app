Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"

  # user related routes
  resources :users, only:[:create, :edit, :show, :update] do
    resources :reservations, only:[:index, :show]
  end

  get "/sign_up" => "users#new", as: "sign_up"
  post "/sign_up" => "users#create"

  get "/login" => "sessions#new", as: "login"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy", as: "logout"

  # google oauth
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"


  # duty ajax search
  get "duties/ajax_search" => "duties#ajax_search", as: "ajax_search"

  # post and reservation related routes
  resources :duties do
    resources :reservations
  end


end
