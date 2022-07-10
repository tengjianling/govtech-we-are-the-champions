Rails.application.routes.draw do
  resources :matches
  resources :registrations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/create-registrations" => "registrations#create_registrations"

  # Defines the root path route ("/")
  root "home#index"
end
