desc "Pull game data for season"
task :game_dump, [:season] => :environment do |_t, args|
  season = if args[:season].present?
             Season.find_by_year_start(args[:season])
           else
             Season.last
           end

  season.games.find_each do |game|
    puts formatted_game_info(season, game)
  end
end

private

def formatted_game_info(season, game)
  [
    season.year_start,
    game.game_number,
    game.away_team.abbreviation,
    game.home_team.abbreviation,
    game.date,
    game.playoffs
  ].join(",")
end
