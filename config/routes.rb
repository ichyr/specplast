Rails.application.routes.draw do

  root to: 'visitors#index'

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'


  resources :vmilists do
    collection do
      get 'preview'
    end
  end

  resources :specdata

  resources :specializations

  resources :general_infos

  get 'moderator', to: 'moderator#index'
  get 'moderator/specialization', to: 'moderator#specialization'

  get 'admin', to: 'admin#index'
  get 'admin/instruktors', to: 'admin#instruktors'
  get 'admin/moderators', to: 'admin#moderators'
  get 'admin/administrators', to: 'admin#administrators'
  get 'admin/bulava', to: 'admin#bulava'

  # Visitors controller
  get "activities", to: 'visitors#activities'
  get "vmilosti", to: 'visitors#vmilosti'
  get "proby", to: 'visitors#proby'
  get "instructors", to: 'visitors#instructors'
  get "provid", to: 'visitors#provid'
  get "bulava", to: 'visitors#bulava'
  get "visitors/api/:id", to: 'visitors#api'
  
  #  User controller
  devise_for :users

  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', :as => :user
  get 'users/edit/:id', to: 'users#edit'
  put 'users/:id', to: 'users#update'
  patch 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#delete'

  # Exceptions and errors 
  get '/403', to: "error#error_403"
  get '/404', to: "error#error_404"
  get '/500', to: "error#error_500"

  # Default root
  get '*path', to: redirect("/404")

end
