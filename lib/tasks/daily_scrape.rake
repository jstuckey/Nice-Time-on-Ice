namespace :scrape do
  desc "Scrape today's game data from NHL.com"
  task :today => :environment do
    games = GameScraper.new.call.games
    save_games(games)
    email_results
  end

  desc "Scrape game data for specified date from NHL.com"
  task :date, [:year, :month, :day] => [:environment] do |t, args|
    year = args[:year]
    month = args[:month]
    day = args[:day]
    raise "Format must be: rake scrape:date[2015,5,25]" unless year && month && day

    date = Date.new(year.to_i, month.to_i, day.to_i)
    games = GameScraper.new(date: date).call.games
    save_games(games)
    email_results
  end
end

private

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
  ScraperMailer.results_email(results_for_email).deliver_now
end
