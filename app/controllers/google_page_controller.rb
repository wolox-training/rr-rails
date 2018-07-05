class GooglePageController < ApplicationController
  def index
    return redirect_to action: 'login' unless oauth_signed_in?
    @user = current_oauth
  end

  def login
    return redirect_to action: 'index' if oauth_signed_in?
  end
end
