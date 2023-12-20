Rails.application.routes.draw do
  root 'parking_spaces#index'

  # resources :parking_spaces do
  #   member do
  #     patch '/vehicles/:id/unpark', to: 'parking_spaces#unpark_vehicle', as: 'unpark_vehicle'
  #   end
  # end
  # config/routes.rb
  get '/unpark_and_view_fee', to: 'parking#unpark_and_view_fee', as: :unpark_and_view_fee
  get '/delete_vehicle', to: 'parking#delete_vehicle', as: :delete_vehicle

  get 'manual_parking/:id', to: 'parking_spaces#new_manual_parking', as: 'new_manual_parking'
  post 'manual_parking', to: 'parking_spaces#create_manual_parking', as: 'create_manual_parking'

  resources :entrances, only: [:new, :create]
end