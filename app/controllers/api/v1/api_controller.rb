module Api
  module V1
    class ApiController < DeviseTokenAuthController
      # All API controllers require to have the user authenticated
      before_action :authenticate_user!
      # We set the current locale for our user
      before_action :set_user_locale
      # All API controllers are paginated
      include Wor::Paginate

      protected

      def set_user_locale
        I18n.locale = current_user.locale.to_sym || I18n.default_locale
      end
    end
  end
end
