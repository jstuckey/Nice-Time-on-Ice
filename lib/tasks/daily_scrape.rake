namespace :scrape do
  desc "Scrape today's game data from NHL.com"
  task :today => :environment do
    scrape_for_date
  end

  desc "Scrape game data for specified date from NHL.com"
  task :date, [:year, :month, :day] => [:environment] do |t, args|
    year, month, day = args[:year], args[:month], args[:day]
    raise "Format must be: rake scrape:date[2015,5,25]" unless year && month && day

    date = Date.new(year.to_i, month.to_i, day.to_i)
    scrape_for_date(date)
  end
end

private

def scrape_for_date(date = nil)
  games = GameScraper.new(date: date).call.games
  save_games(games)
rescue => ex
  log_result(ex.message)
ensure
  email_results
end

def save_games(games)
  games.each do |game|
    message = attempt_to_save(game)
    log_result(message)
  end
end

def attempt_to_save(game)
  if game.save
    "Saved game #{game.game_number}"
  else
    "Error saving game #{game.game_number}: #{game.errors.full_messages.join(". ")}"
  end
end

def log_result(message)
  puts message
  Rails.logger.info message
  results_for_email << message
end

def results_for_email
  @results_for_email ||= Array.new
end

def email_results
  return unless Rails.env.production?
  ScraperMailer.results_email(results_for_email).deliver_now
end
