Rails.application.routes.draw do
  get 'static_pages/home'
  devise_for :users
  resources :cohorts
  resources :courses
  resources :instructors
  resources :students
  get '/students/:id/addcohort', to: 'students#addcohort', as: :addcohort
  post '/students/:id/addcohort', to: 'students#postcohort'
  patch 'students/ajax/:id', to: 'students#ajax'

  authenticated do
    root 'static_pages#home', as: :authenticated_root
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end
end