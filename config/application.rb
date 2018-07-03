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
      domain: Rails.application.secrets.mailer_domain,
      username: Rails.application.secrets.mailer_user,
      password: Rails.application.secrets.mailer_password,
      address: Rails.application.secrets.mailer_address,
      port: Rails.application.secrets.mailer_port.to_i,
      authentication: Rails.application.secrets.mailer_auth.to_sym
    }
  end
end
