Rails.application.routes.draw do
  get 'schedules/index'
  get 'schedules/new'
  get 'schedules/show'
  devise_for :users
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
