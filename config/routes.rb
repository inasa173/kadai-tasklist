Rails.application.routes.draw do
  root to: 'tasklists#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
#  get 'logout', to: 'sessions#new'
  get 'signup', to: 'users#new'
#  post 'signup', to: 'tasklists#index'
  resources :users, only: [:new, :create]
  
  resources :tasklists
end
