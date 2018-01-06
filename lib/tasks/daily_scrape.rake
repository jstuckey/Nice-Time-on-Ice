namespace :scrape do
  desc "Scrape today's game data from NHL.com"
  task today: :environment do
    scrape_for_date
  end

  desc "Scrape game data for specified date from NHL.com"
  task :date, [:year, :month, :day] => [:environment] do |_t, args|
    year = args[:year]
    month = args[:month]
    day = args[:day]

    unless year && month && day
      fail "Format must be: rake scrape:date[2015,5,25]"
    end

    date = Date.new(year.to_i, month.to_i, day.to_i)
    scrape_for_date(date)
  end
end

private

def scrape_for_date(date = nil)
  games = GameScraper.new(date: date).call.games
  results = GameSaver.new(games).call.results
  log_results(results)
rescue => ex
  log_result(ex.message)
ensure
  email_results
end

def log_results(messages)
  messages.each { |m| log_result(m) }
end

def log_result(message)
  puts message
  Rails.logger.info message
  results_for_email << message
end

def results_for_email
  @results_for_email ||= []
end

def email_results
  return unless Rails.env.production?
  ScraperMailer.results_email(results_for_email).deliver_now
end
