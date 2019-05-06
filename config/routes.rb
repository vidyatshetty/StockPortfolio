Rails.application.routes.draw do
  devise_for :users
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'welcome/index' => 'welcome#index'


  resources :stocks do
	resources :user_stocks
end


resources :users do
	  	resources :user_stocks 
end
root 'welcome#index'
end
