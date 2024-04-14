Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # API namespace
  namespace :api, defaults: { format: :json } do
    resources :features, only: [:index, :show] do
      resources :comments, only: [:create, :index]
    end
  end
end
