Rails.application.routes.draw do

  get 'users/show'

  resources :wikis

  devise_for :users
  match 'users/:id' => 'users#show', :as => :profile, via: :get
  resources :users do
    resources :collaborators, only: [:create, :destroy]
  end

  # Stripe payment SubscriptionsController
  resource :subscription
  resource :card

  get 'downgrade_account' => 'subscription#downgrade_account'
  post 'stripe_checkout' => 'subscriptions#stripe_checkout'

  # Root path(s), welcome & about
  get 'about' => 'welcome#about'

  authenticated :user do
    root 'wikis#index', as: :authenticated_user
  end

  root 'welcome#index'

end
