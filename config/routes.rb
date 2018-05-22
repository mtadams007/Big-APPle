Rails.application.routes.draw do
  devise_for :users
  # our root is our homepage that allows us to create new empty schedules
  root "schedules#new"

  # get 'home/home'
  # devise_for :users
  get 'sessions/new'
  get 'users/sign_in'
<<<<<<< Updated upstream
  # This post route is for creating our ajax calls
  post 'activities/index'
=======
  post 'activities/new'
>>>>>>> Stashed changes

  resources :schedules
  resources :activities
  resources :users
end
