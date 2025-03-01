Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # This allows for user-readable routing for home/away matches by team/country
  resources :teams, except: [ :create, :destroy, :new, :edit ] do
    member do
      get :home_matches
      get :away_matches
    end
  end

  resources :matches, only: [ :create, :index, :show, :update ]
end
