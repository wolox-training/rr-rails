class NotificationsMailer < ApplicationMailer
  include Sidekiq::Mailer

  def new_rent_email(rent)
    @rent = rent
    @user = rent.user
    @book = rent.book
    mail to: @user.email, subject: 'New rent notification from WBooks', &:html
  end
end
