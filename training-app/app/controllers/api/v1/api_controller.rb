module Api
  module V1
    class ApiController < ApplicationController
      # All API controllers require to have the user authenticated
      before_action :authenticate_user!
      # All API controllers are paginated
      include Wor::Paginate
    end
  end
end