class DeviseTokenAuthController < ApplicationController
  include Pundit
  include DeviseTokenAuth::Concerns::SetUserByToken
end
