Rails.application.routes.draw do

  devise_for :users
  resources :wikis
  resources :charges, only: [:new, :create]
  resources :wikis do
   resources :charges, only: [:new, :create]
  end
  root to: 'welcome#index'
  get 'welcome/index'
  get 'welcome/about'

end
