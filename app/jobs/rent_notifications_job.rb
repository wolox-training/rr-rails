class RentNotificationsJob < ApplicationJob
  queue_as :mailer

  def perform(rent)
    NotificationsMailer.new_rent_email.deliver_later
  end
end
