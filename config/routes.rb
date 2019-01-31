# frozen_string_literal: true

Rails.application.routes.draw do
  get 'static_pages/home'
  devise_for :users
  resources :cohorts
  post '/cohorts/:id', to: 'cohorts#addinstructor'
  resources :courses
  resources :instructors
  resources :students
  patch '/students/ajax/:id', to: 'students#ajax'
  get '/students/:id/addcohort', to: 'students#addcohort', as: 'addcohort'
  post '/students/:id/addcohort', to: 'students#postcohort'
  get '/cohorts/:id/addstudent', to: 'cohorts#addstudent', as: 'addstudent'
  post '/cohorts/:id/addstudent', to: 'cohorts#poststudent'
  delete '/cohorts/:id/addstudent/:student_id', to: 'cohorts#removestudent'

  authenticated do
    root 'static_pages#home', as: :authenticated_root
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
end
