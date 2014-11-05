Rails.application.routes.draw do

  get 'admin', to: 'admin#index'
  get 'admin/instruktors', to: 'admin#instruktors'
  get 'admin/moderators', to: 'admin#moderators'
  get 'admin/administrators', to: 'admin#administrators'
  get 'admin/bulava', to: 'admin#bulava'

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
	root to: 'visitors#index'

  devise_for :users

  get "activities", to: 'visitors#activities'
  get "vmilosti", to: 'visitors#vmilosti'
  get "proby", to: 'visitors#proby'
  get "instructors", to: 'visitors#instructors'
  get "provid", to: 'visitors#provid'
  get "bulava", to: 'visitors#bulava'
  get "visitors/api/:id", to: 'visitors#api'

  resources :vmilists

  resources :specdata

  resources :specializations

  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', :as => :user
  get 'users/edit/:id', to: 'users#edit'
  put 'users/:id', to: 'users#update'
  patch 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#delete'
end
