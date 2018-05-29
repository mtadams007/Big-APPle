Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root "schedules#new"

  # get 'home/home'
  # devise_for :users

  post 'activities/new'
  get 'schedules/choose_museums'
  get 'activities/new_choice'
  get 'schedules/latest'

  resources :schedules
  resources :activities
  resources :users
end
