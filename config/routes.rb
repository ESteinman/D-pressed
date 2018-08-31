Rails.application.routes.draw do

  devise_for :users
  root controller: :articles, action: :index
  resources :articles, only: [:create, :new, :show] do 
    resources :ratings, only: [:create]
  end
  resources :users, only: [:show, :update]

  resources :articles do
    resources :comments
    resources :categories
  end

  scope "(:locale)", locale: /en|se/ do
    resources :books
  end

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks], controllers: {
      sessions: 'api/sessions',
      registrations: 'api/registrations'
    }

    resources :articles, only: [:index, :show]
  end
end

