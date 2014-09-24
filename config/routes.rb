Rails.application.routes.draw do

  get 'users', to: 'users#index'

  get 'users/:id', to: 'users#show'

  get 'users/edit'

  get 'users/update'

  get 'users/delete'

	root to: 'visitors#index'

  resources :vmilists

  resources :specdata

  resources :specializations

  devise_for :users
end
