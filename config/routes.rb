Rails.application.routes.draw do
  resources :teams_creators
  resources :teams
  resources :matches_creators
  resources :matches
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "/create-registrations" => "registrations#create_registrations"
  get "/results" => "results#index"

  # match '/destroy_them_all', to: 'registrations_creators#destroy_them_all', via: :delete
  match '/destroy_all', to: 'home#destroy_all', via: :delete
  match '/destroy_all', to: 'home#destroy_all', via: :get

  # Defines the root path route ("/")
  root "home#index"
end
