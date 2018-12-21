Rails.application.routes.draw do
  resources :activities
  resources :users
  resources :foods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
