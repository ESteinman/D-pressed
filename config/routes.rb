Rails.application.routes.draw do
  devise_for :users
  root controller: :articles, action: :index
  resources :articles, only: [:create, :new, :show] do 
    resources :ratings, only: [:create]
  end
  resources :users, only: [:show, :update]

  resources :articles do
    resources :comments
  end


  resources :users, only: [:show, :update]
  post :charges, controller: :users, action: :create_subscription

  scope "(:locale)", locale: /en|se/ do
    resources :books
  end
end

