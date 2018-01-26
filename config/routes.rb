Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :users
  resources :users
  get 'welcome/index'
  get 'welcome/about'
end
