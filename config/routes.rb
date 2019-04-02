Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/top'
end
