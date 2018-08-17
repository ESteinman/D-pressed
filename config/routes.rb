Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  
  root controller: :articles, action: :index
  resources :articles, only: [:create, :new, :show]
  
end
