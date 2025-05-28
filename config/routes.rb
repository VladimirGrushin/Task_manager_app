Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  resources :tasks do
    collection do
      get "admin", to: "tasks#admin_index", as: :admin
    end
  end

  resources :categories, only: [ :index ]
  root to: redirect("/tasks")
end
