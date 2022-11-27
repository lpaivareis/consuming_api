Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "jobs#index"

  resources :jobs, only: [:index, :show]

  post "/jobs/:id/user_apply_job", to: "jobs#user_apply_job", as: "apply_job"
end
