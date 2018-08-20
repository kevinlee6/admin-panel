Rails.application.routes.draw do
  resources :cohorts
  resources :courses
  resources :instructors
  resources :students

  root 'courses#index'
end