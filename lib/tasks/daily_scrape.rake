namespace :scrape do
  desc "Scrape today's game data from NHL.com"
  task :today => :environment do
    games = GameScraper.new.call.games
    save_games(games)
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
  end
end

private

def save_games(games)
  games.each do |game|
    if game.save
      message = "Saved game #{game.game_number}"
    else
      message = "Error saving game #{game.game_number}: #{game.errors.full_messages.join(". ")}"
    end
    puts message
    Rails.logger.info message
  end
end
