class DeviseTokenAuthController < ApplicationController
  include Pundit
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Optional authentication
  before_filter :authenticate_user
end
