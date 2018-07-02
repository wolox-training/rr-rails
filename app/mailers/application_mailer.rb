class ApplicationMailer < ActionMailer::Base
  default from: ENV['no-reply@training.wolox.com.ar']
  layout 'mailer'
end
