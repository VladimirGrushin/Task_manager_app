Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  resources :tasks
  resources :categories, only: [ :index ]
  root to: "tasks#index"
end
