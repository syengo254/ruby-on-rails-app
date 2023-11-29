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

  root to: "main#index"

  # Defines the root path route ("/")
  # root "posts#index"
end
