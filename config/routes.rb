Rails.application.routes.draw do

  resources :specdata

	root to: 'visitors#index'

	scope :admin do
		resources :specializations
	end

  devise_for :users
end
