Rails.application.routes.draw do

  resources :wikis

  devise_for :users
  #devise_for :users, :controllers => { :sessions => 'sessions' }

  # Stripe payment ChargesController
  resources :charges

  get 'about' => 'welcome#about'
  root 'welcome#index'

end
