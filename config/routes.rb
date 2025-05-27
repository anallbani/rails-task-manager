Rails.application.routes.draw do
  get "tasks", to: "tasks#index"
  get "tasks/:id", to: "tasks#show", as: :task

  get "up" => "rails/health#show", as: :rails_health_check
end
