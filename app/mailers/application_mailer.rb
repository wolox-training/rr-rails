class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.secrets.mailer_email
  layout 'mailer'
end
