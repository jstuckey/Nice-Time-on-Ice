# Emails the resutls of an attempt to scrape the NHL.com schdule page
# Allows me to monitor scraping jobs to see if anything goes wrong
class ScraperMailer < ApplicationMailer
  default to: "laichitor.lumpit@gmail.com"
  default from: "scraper@nicetimeonice.com"

  def results_email(results)
    @results = Array(results)
    mail(subject: "Scraping Results")
  end
end
