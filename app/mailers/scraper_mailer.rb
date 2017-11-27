class ScraperMailer < ApplicationMailer
  default to: "laichitor.lumpit@gmail.com"
  default from: "scraper@nicetimeonice.com"

  def results_email(results)
    @results = Array(results)
    mail(subject: "Scraping Results")
  end
end
