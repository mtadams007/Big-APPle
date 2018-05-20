Rails.application.routes.draw do
  get 'activities/new'
  get 'activities/new'
  get 'schedules/index'
  get 'schedules/new'
  get 'schedules/show'
  devise_for :users
  root "schedules#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get 'home/home'
  # devise_for :users
  get 'sessions/new'

  # root :to => redirect("/users/sign_in")
  # root to: 'devise/sessions#new'

  # devise_for :users
  #   devise_scope :user do

  #     authenticated :user do
  #     #modify to set the right homepage
  #     root 'schedules#index', as: :authenticated_root
  #   end

  #   unauthenticated do
  #     root 'devise/sessions#new', as: :unauthenticated_root
  #   end
  # end

  resources :schedules
  resources :activities
  resources :users
end
