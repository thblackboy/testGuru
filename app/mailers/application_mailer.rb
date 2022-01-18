class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <mail@example.com>}
  layout 'mailer'
end
