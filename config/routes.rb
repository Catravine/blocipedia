Rails.application.routes.draw do

  resources :wikis

  devise_for :users
  #devise_for :users, :controllers => { :sessions => 'sessions' }

  # Stripe payment ChargesController
  resources :charges

  get 'downgrade_account' => 'charges#downgrade_account'

  get 'about' => 'welcome#about'
  root 'welcome#index'

end
