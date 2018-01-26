Rails.application.routes.draw do
  resources :wikis
  devise_for :users
  resources :users
  root to: 'welcome#index'
  get 'welcome/index'
  get 'welcome/about'
end
