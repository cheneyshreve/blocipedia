Rails.application.routes.draw do

  devise_for :users
  resources :wikis
  resources :charges, only: [:new, :create]
  root to: 'welcome#index'
  get 'welcome/index'
  get 'welcome/about'

end
