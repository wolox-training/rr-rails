# frozen_string_literal: true

Rails.application.routes.draw do
  # User authentication
  mount_devise_token_auth_for 'User', at: 'auth'
  # API entries are inside a namespace
  namespace :api do
    # First (and only) version of the API
    namespace :v1 do
      resources :books, only: %I[index show]
    end
  end
end
