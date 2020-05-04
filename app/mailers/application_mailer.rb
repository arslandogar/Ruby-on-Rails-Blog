class ApplicationMailer < ActionMailer::Base
  default from: ENV['YOUR_EMAIL']
  layout 'mailer'
end
