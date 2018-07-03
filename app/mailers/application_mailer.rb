class ApplicationMailer < ActionMailer::Base
<<<<<<< HEAD
  default from: RAILS.application.secrets.mailer_address
=======
  default from: ENV['no-reply@training.wolox.com.ar']
>>>>>>> 7e19dee044673882f06d3b04ca3a67fa01aabf6f
  layout 'mailer'
end
