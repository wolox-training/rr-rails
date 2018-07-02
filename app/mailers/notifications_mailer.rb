class NotificationsMailer < ApplicationMailer
  def new_rent_email(rent)
    @rent = rent
    @user = rent.user
    @book = rent.book
    mail to: @user.email, subject: 'New rent notification from WBooks'  do |format|
      format.html
    end
  end
end
