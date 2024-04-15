Rails.application.routes.draw do
  get 'home/index'
  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Set the root URL
  root "api/features#index"

  # API namespace
  namespace :api, defaults: { format: :json } do
    resources :features, only: [:index, :show] do
      resources :comments, only: [:create, :index, :destroy]
    end
  end
end
