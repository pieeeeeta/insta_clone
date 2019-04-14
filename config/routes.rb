Rails.application.routes.draw do
  get 'pictureposts/new'
  get 'pictureposts/show'
  get 'users/show'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users do
    member do
      get :following
      get :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :pictureposts do
    resources :comments, only: [:create]
  end
  root 'home#top'
  get 'home/top'
end
