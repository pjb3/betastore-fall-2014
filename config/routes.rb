require 'sidekiq/web'

Betastore::Application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :subscriptions
  get '/products' => 'products#index'

  namespace :admin do
    resources :products
    get  '/login' => 'logins#new'
    post '/login' => 'logins#create'
    # get '/products/new' => 'products#new', as: 'new_product'
    # get '/products/:product_id' => 'products#show', as: 'product'
    # get '/products' => 'products#index'
    # post '/products' => 'products#create'
  end

  root :to => 'subscriptions#new'
end
