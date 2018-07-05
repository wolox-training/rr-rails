require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Google callback for devise
  devise_for :users, singular: 'oauth', controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # User authentication
  mount_devise_token_auth_for 'User', at: 'auth'
  # Mount Sidekiq status
  mount Sidekiq::Web => '/sidekiq'
  # API entries are inside a namespace
  namespace :api do
    # First (and only) version of the API
    namespace :v1, defaults: { format: 'json' } do
      resources :books, only: %I[index show] do
        resources :rents, controller: 'books/rents', only: %I[index]
      end
      resources :users do
        resources :rents, controller: 'users/rents', only: %I[index create]
      end
      resources :search, only: %I[index]
      resources :book_suggestions, only: %I[create]
    end
  end
  # Outside of the api, there is a visual form for BookSuggestions
  resources :book_suggestions, only: %I[new]
  # Resource routes for search
  resources :search, only: %I[index]
  # Google auth test endpoint
  get '/google', to: 'google_page#index'
  get '/google/login', to: 'google_page#login'
end
