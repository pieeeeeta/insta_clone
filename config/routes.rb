Rails.application.routes.draw do
  get 'pictureposts/new'
  get 'pictureposts/show'
  get 'users/show'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show]
  resources :pictureposts
  root 'home#top'
  get 'home/top'
end
