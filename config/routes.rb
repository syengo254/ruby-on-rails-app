Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "sign-up" => "registrations#new", as: :sign_up

  post "sign-up" => "registrations#create"

  get "sign-in" => "sessions#new", as: :sign_in

  post "sign-in" => "sessions#create"

  get "logout" => "registrations#logout", as: :logout

  get "about", to: "about#index", as: :about

  get "contact-us", to: "main#contact", as: :contact

  get "password", to: "accounts#edit", as: :password

  patch "password", to: "accounts#update"

  get "password/reset", to: "password_reset#reset", as: :password_reset
  post "password/reset", to: "password_reset#reset"

  # edit will show the form on click email link, update is to update with new pass.
  get "password/reset/edit", to: "password_reset#edit", as: :password_edit
  patch "password/reset/edit", to: "password_reset#update"

  root to: "main#index"

  # Defines the root path route ("/")
  # root "posts#index"
end
