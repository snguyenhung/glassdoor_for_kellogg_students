Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "interview_experience_posts#index"
  resources :companies
  resources :jobs
  resources :interview_experience_posts
  devise_for :student_profiles
  resources :student_profiles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
