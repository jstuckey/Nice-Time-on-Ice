desc "Check for missing games"
task :missing_games, [:season] => :environment do |_t, args|
  year_start = if args[:season].present?
                 args[:season].to_s[0..3]
               else
                 Season.last.year_start
               end

  missing_games = GameInspector.new(year_start).missing_games

  if missing_games.length.positive?
    log_missing_games(missing_games, year_start)
  else
    log_no_missing_games(year_start)
  end
end

private

def log_no_missing_games(year)
  puts "No missing games for the #{year}#{year.to_i + 1} season!"
end

def log_missing_games(missing_games, year)
  puts "The following games are missing for the #{year}#{year.to_i + 1} season:"
  puts
  missing_games.each { |game| puts game }
end
