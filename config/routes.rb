Rails.application.routes.draw do

	root to: 'visitors#index'

  resources :vmilists

  resources :specdata

  resources :specializations

  devise_for :users

  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', :as => :user
  get 'users/edit/:id', to: 'users#edit'
  put 'users/:id', to: 'users#update'
  patch 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#delete'
end
