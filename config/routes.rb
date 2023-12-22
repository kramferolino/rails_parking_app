Rails.application.routes.draw do
  resources :vehicles, only: %i[new create show unpark]
  resources :entrances, only: %i[index show]
  resources :parking_sessions, only: %i[index show]

  get 'parking_confirmation/:id', to: 'vehicles#parking_confirmation', as: 'parking_confirmation'
  get 'payment_confirmation/:parking_space_id/:fee', to: 'vehicles#payment_confirmation', as: 'payment_confirmation'
  
  resources :entrances do
    resources :parking_spaces
  end

  resources :parking_sessions, only: [:index] do
    collection do
      get :search
    end
  end  

  # config/routes.rb
  resources :vehicles do
    member do
      delete 'unpark', to: 'vehicles#unpark'
    end
  end

  root to: 'entrances#index'

end