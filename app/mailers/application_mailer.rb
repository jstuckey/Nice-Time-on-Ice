class ApplicationMailer < ActionMailer::Base
  default from: "scraper@nicetimeonice.com",
          to:   "klash64@gmail.com"
  layout 'mailer'
end
