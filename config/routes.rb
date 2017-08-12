Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users do
    member do
      get :following, :followers
    end
    resources :groups, only: [:index, :new, :create] do
      resources :messages, only: [:index, :create]
    end
  end
  resources :relationships, only: [:create, :destroy]
end
