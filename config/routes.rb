Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    delete :sign_out, to: 'devise/sessions#destroy'
  end
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
