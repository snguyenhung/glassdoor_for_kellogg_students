Rails.application.routes.draw do
  resources :interview_experience_posts
  devise_for :student_profiles
  resources :student_profiles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
