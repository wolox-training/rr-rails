Rails.application.configure do |config|
  config.active_job.queue_adapter = :sidekiq

  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    address: ENV['MAILER_ADDRESS'],
    port: ENV['MAILER_PORT'],
    domain: ENV['MAILER_DOMAIN'],
    user_name: ENV['MAILER_USERNAME'],
    password: ENV['MAILER_PASSWORD'],
    authentication: ENV['MAILER_AUTH']
  }
end
