class RentNotificationsJob < ApplicationJob
  queue_as :mailer

  def perform(rent_id)
    NotificationsMailer.new_rent_email(rent_id).deliver_later
  end
end
