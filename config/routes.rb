require 'sidekiq/web'

Rails.application.routes.draw do
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
    end
  end
end
