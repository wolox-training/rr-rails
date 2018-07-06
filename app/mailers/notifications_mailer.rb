class NotificationsMailer < ApplicationMailer
  def new_rent_email(rent_id)
    @rent = Rent.find(rent_id)
    @user = rent.user
    @book = rent.book
    mail(to: @user.email, subject: I18n.t('mail.notifications.rent.subject')) do |config|
      config.html
      config.text
    end
  end
end
