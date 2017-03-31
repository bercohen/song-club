Rails.application.routes.draw do
  resources :performers
  devise_for :users
  resources :users, :only => [:show, :index]
  resources :groups do 
  resources :concerts
  resources :members
  end
  root to: 'static#index'

  get '/concerts' => 'concerts#list', as: :concerts
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
