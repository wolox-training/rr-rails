class ApplicationMailer < ActionMailer::Base
  default from: RAILS.application.secrets.mailer_address
  layout 'mailer'
end
