Rails.application.routes.draw do

  get 'users/show'

  resources :wikis

  devise_for :users
  match 'users/:id' => 'users#show', via: :get
  resources :user, only: [:show]
  #devise_for :users, :controllers => { :sessions => 'sessions' }

  # Stripe payment ChargesController
  resources :charges
  get 'downgrade_account' => 'charges#downgrade_account'

  get 'about' => 'welcome#about'
  root 'welcome#index'

end
