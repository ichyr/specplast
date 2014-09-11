Rails.application.routes.draw do

	root to: 'visitors#index'

  resources :vmilists

  resources :specdata

  resources :specializations

  devise_for :users
end
