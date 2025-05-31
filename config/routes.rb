Rails.application.routes.draw do
  devise_for :users

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Tasks routes
  resources :tasks do
    collection do
      get "admin", to: "tasks#admin_index", as: :admin
    end
  end

  # Categories routes
  resources :categories, only: [:index]

  # Root route - changed from redirect to direct action
  root "tasks#index"
end
