Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Routes the about request to the about controller
  get "about-us" => "about#index", as: :about

  get "password" => "passwords#edit", as: :edit_password
  patch "password" => "passwords#update"

  #For the home page
  get "/" => "main#index", as: :root

  #These have the same name so that they both happen at the same time when sign_up is used
  get "sign_up" => "registrations#new", as: :sign_up

  get "sign_in" => "sessions#new", as: :sign_in

  post "sign_up" => "registrations#create"

  post "sign_in" => "sessions#create"


  delete "logout" => "sessions#destroy"

  get "password/reset" => "password_resets#new"
  # The post request here is used to create a new password reset request while the patch below above actually updates the password
  post "password/reset" => "password_resets#create"

  get "password/reset/edit" => "password_resets#edit"
  patch "password/reset/edit" => "password_resets#update"

  get "/auth/twitter/callback" => "omniauth"

  get "account" => "account#index"
  delete "account" => "account#delete"

  patch "update_profile_picture" => "account#update_profile_picture"

  post "follow" => "relationship#new"

  delete "follow" => "relationship#delete"

  # This automatically maps to tweet actions such as new, edit and delete
  resources :tweets

  # Defines the root path route ("/")
  # root "posts#index"
end
