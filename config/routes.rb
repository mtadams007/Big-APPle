Rails.application.routes.draw do
  devise_for :users
  root "schedules#new"

  # get 'home/home'
  # devise_for :users
  get 'sessions/new'
  get 'users/sign_in'
  post 'activities/new'
<<<<<<< HEAD
=======
  get 'schedules/choose_museums'
>>>>>>> master

  resources :schedules
  resources :activities
  resources :users
end
