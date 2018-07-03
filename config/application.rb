require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WBooks
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.active_job.queue_adapter = :sidekiq
    config.action_mailer.smtp_settings = {
<<<<<<< HEAD
      domain: Rails.secrets.mailer_domain,
      username: Rails.secrets.mailer_user,
      password: Rails.secrets.mailer_password,
      address: Rails.secrets.mailer_address,
      port: Rails.secrets.mailer_port,
      authentication: Rails.secrets.mailer_auth
=======
      domain: ENV['MAILER_DOMAIN'],
      username: ENV['MAILER_USERNAME'],
      password: ENV['MAILER_PASSWORD'],
      address: ENV['MAILER_ADDRESS'],
      port: ENV['MAILER_PORT'],
      authentication: ENV['MAILER_AUTH']
>>>>>>> 7e19dee044673882f06d3b04ca3a67fa01aabf6f
    }
  end
end
