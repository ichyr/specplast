Rails.application.routes.draw do

  get 'users', to: 'users#index'

  get 'users/:id', to: 'users#show'

  get 'users/edit/:id', to: 'users#edit'

  put 'users/:id', to: 'users#update'

  delete 'users/:id', to: 'users#delete'

	root to: 'visitors#index'

  resources :vmilists

  resources :specdata

  resources :specializations

  devise_for :users
end
