Rails.application.routes.draw do

  root to: 'dashboard#index'
  resources :activities
  resources :foods
  resources :user_foods, only: [:new,:create]
  resources :users
  	get    '/signup',  to: 'users#new'
  	post   '/signup',  to: 'users#create'
  	get    '/login',   to: 'sessions#new'
  	post   '/login',   to: 'sessions#create'
  	delete '/logout',  to: 'sessions#destroy'
    get    '/users/:id/profile',  to: 'users#profile', as: 'profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
