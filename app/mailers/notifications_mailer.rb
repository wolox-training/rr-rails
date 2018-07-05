class NotificationsMailer < ApplicationMailer
  def new_rent_email(rent_id)
    @rent = Rent.find(rent_id)
    @user = rent.user
    @book = rent.book
    mail(to: @user.email, subject: 'New rent notification from WBooks', &:html)
  end
end
