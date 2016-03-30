Rails.application.routes.draw do

  get 'users/show'

  resources :wikis

  devise_for :users
  match 'users/:id' => 'users#show', via: :get
  resources :user, only: [:show]

  # Stripe payment SubscriptionsController
  resource :subscription
  resource :card
  get 'downgrade_account' => 'subscription#downgrade_account'
  post 'stripe_checkout' => 'subscriptions#stripe_checkout'

  get 'about' => 'welcome#about'
  root 'welcome#index'

end
