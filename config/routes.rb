Rails.application.routes.draw do
  resources :vehicles
  resources :parking_sessions
  resources :parking_spaces
  resources :entrances

  resources :vehicles do
    post :park, on: :collection
    patch :unpark, on: :member
    # get :unpark, on: :member, constraints: {vehicle_id: /[0-9]+/}
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "entrances#index"
end
