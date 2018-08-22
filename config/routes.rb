Rails.application.routes.draw do
  get 'static_pages/home'
  devise_for :users
  resources :cohorts
  resources :courses
  resources :instructors
  resources :students

  root 'static_pages#home'
end