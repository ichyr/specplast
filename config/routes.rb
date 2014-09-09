Rails.application.routes.draw do
  resources :specializations

  root to: 'visitors#index'
  devise_for :users
end
