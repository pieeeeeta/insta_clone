Rails.application.routes.draw do
  get 'pictureposts/new'
  get 'pictureposts/show'
  get 'users/show'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
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
