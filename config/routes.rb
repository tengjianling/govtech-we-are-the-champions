Rails.application.routes.draw do
  resources :matches_creators
  resources :registrations_creators
  resources :matches
  resources :registrations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/create-registrations" => "registrations#create_registrations"

  match '/destroy_them_all', to: 'registrations_creators#destroy_them_all', via: :delete

  # Defines the root path route ("/")
  root "home#index"
end
