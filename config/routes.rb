Rails.application.routes.draw do
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
  get '/pictureposts/search', to: 'pictureposts#search'
  resources :pictureposts do
    resources :comments, only: [:create]
  end
  post '/like/:picturepost_id', to: 'likes#like', as: 'like'
  delete '/like/:picturepost_id', to: 'likes#unlike', as: 'unlike'
  root 'home#top'
  get 'home/top'
end
