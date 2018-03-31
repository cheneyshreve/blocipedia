Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/about'

  devise_for :users
  resources :users, only: [:show]
  resources :wikis
  resources :charges, only: [:new, :create]
  resources :wikis do
   resources :charges, only: [:new, :create]
   resources :collaborates, only: [:create, :destroy]
  end
  root to: 'wikis#index'


end
