class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.secrets.mailer_address
  layout 'mailer'
end
