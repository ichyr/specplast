Rails.application.routes.draw do

  root to: 'visitors#index'

  mount Bootsy::Engine => '/bootsy' , as: 'bootsy'

  resources :vmilists do
    collection do
      get :preview
    end
  end

  resources :specdata

  resources :specializations

  resources :general_infos

  resources :registries do
    collection do
      get :autocomplete_vmilist_name
      get :autocomplete_instruktor_name
    end
  end
  
  get 'moderator', to: 'moderator#index'
  get 'moderator/specialization', to: 'moderator#specialization'
  get 'moderator/qualifications/for_approval', to: 'moderator#waiting'
  get 'moderator/qualifications/approved', to: 'moderator#approved'
  get 'moderator/qualifications/need_review', to: 'moderator#noinfo'
  get 'moderator/qualifications/:id/:new_state', to: 'moderator#change_qualification'
  get 'qualifications/:id/delete/', to: 'moderator#delete_qualification'

  get 'admin', to: 'admin#index'
  get 'admin/instruktors', to: 'admin#instruktors'
  get 'admin/moderators', to: 'admin#moderators'
  get 'admin/administrators', to: 'admin#administrators'
  get 'admin/bulava', to: 'admin#bulava'
  get 'admin/contacts', to: 'admin#administrator_contacts'

  # Visitors controller
  get 'activities', to: 'visitors#activities'
  get 'vmilosti', to: 'visitors#vmilosti'
  get 'proby', to: 'visitors#proby'
  get 'instructors', to: 'visitors#instructors'
  get 'provid', to: 'visitors#provid'
  get 'bulava', to: 'visitors#bulava'
  get 'administration', to: 'visitors#administration'
  get 'visitors/api/:id', to: 'visitors#api'
  
  #  User controller
  devise_for :users, :controllers => { :registrations => 'registration' }

  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', :as => :user
  get 'users/edit/:id', to: 'users#edit'
  put 'users/:id', to: 'users#update'
  patch 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#delete'

  # Exceptions and errors 
  namespace :admin do
    get '/403', to: 'error#error_403'
    get '/404', to: 'error#error_404'
    get '/500', to: 'error#error_500'
  end

  # public JSON APi interface 
  get 'api/vmilist/:id', to: 'api#vmilist'
  get 'api/vmilists', to: 'api#vmilist_search'
  get 'api/user/:email', to: 'api#user_achievements'
  get 'api/specialization/:id', to: 'api#specialization'
  get 'api/specialization', to: 'api#specialization_index'

  # Default root
  get '*unmatched_route', to: 'error#error_404'

end
