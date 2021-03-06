Rails.application.routes.draw do

  resources :user_activities
  root to: 'dashboard#index'
  resources :activities
  resources :foods
  resources :user_foods, only: [:new,:create,:edit,:update]
    delete '/user_foods/:id', to: 'user_foods#destroy', as: 'delete_food'
    get '/user_foods/:id/remove', to: 'user_foods#remove'
  resources :user_activities, only: [:show, :edit, :update, :destroy]
    delete '/user_activities/:id', to: 'user_activities#destroy', as: 'delete_activity'
    get '/user_activities/new', to: 'user_activities#new', as: 'new_user_active'
    get '/user_activities/:id/remove', to: 'user_activities#remove'
    post '/user_activities', to: 'user_activities#create', as: 'user_active_create'
  resources :users
  	get    '/signup',  to: 'users#new'
  	post   '/signup',  to: 'users#create'
  	get    '/login',   to: 'sessions#new'
  	post   '/login',   to: 'sessions#create'
  	delete '/logout',  to: 'sessions#destroy'
    get    '/users/:id/profile',  to: 'users#profile', as: 'profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
