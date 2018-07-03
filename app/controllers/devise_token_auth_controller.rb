class DeviseTokenAuthController < ApplicationController
  protect_from_forgery with: :null_session
  include Pundit
  include DeviseTokenAuth::Concerns::SetUserByToken
end
