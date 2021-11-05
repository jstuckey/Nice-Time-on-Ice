puts "Creating seasons..."

Season.create(year_start: 2011, year_end: 2012)
Season.create(year_start: 2012, year_end: 2013)
Season.create(year_start: 2013, year_end: 2014)
Season.create(year_start: 2014, year_end: 2015)
Season.create(year_start: 2015, year_end: 2016)
Season.create(year_start: 2016, year_end: 2017)
Season.create(year_start: 2017, year_end: 2018)

puts "Creating teams..."

Team.create(abbreviation: "ANA", city: "Anaheim",      name: "Ducks",          full_name: "Anaheim Ducks")
Team.create(abbreviation: "ARI", city: "Arizona",      name: "Coyotes",        full_name: "Arizona Coyotes")
Team.create(abbreviation: "BOS", city: "Boston",       name: "Bruins",         full_name: "Boston Bruins")
Team.create(abbreviation: "BUF", city: "Buffalo",      name: "Sabres",         full_name: "Buffalo Sabres")
Team.create(abbreviation: "CGY", city: "Calgary",      name: "Flames",         full_name: "Calgary Flames")
Team.create(abbreviation: "CAR", city: "Carolina",     name: "Hurricanes",     full_name: "Carolina Hurricanes")
Team.create(abbreviation: "CHI", city: "Chicago",      name: "Blackhawks",     full_name: "Chicago Blackhawks")
Team.create(abbreviation: "COL", city: "Colorado",     name: "Avalanche",      full_name: "Colorado Avalanche")
Team.create(abbreviation: "CBJ", city: "Columbus",     name: "Blue Jackets",   full_name: "Columbus Blue Jackets")
Team.create(abbreviation: "DAL", city: "Dallas",       name: "Stars",          full_name: "Dallas Stars")
Team.create(abbreviation: "DET", city: "Detroit",      name: "Red Wings",      full_name: "Detroit Red Wings")
Team.create(abbreviation: "EDM", city: "Edmonton",     name: "Oilers",         full_name: "Edmonton Oilers")
Team.create(abbreviation: "FLA", city: "Florida",      name: "Panthers",       full_name: "Florida Panthers")
Team.create(abbreviation: "LAK", city: "Los Angeles",  name: "Kings",          full_name: "Los Angeles Kings")
Team.create(abbreviation: "MIN", city: "Minnesota",    name: "Wild",           full_name: "Minnesota Wild")
Team.create(abbreviation: "MTL", city: "Montreal",     name: "Canadiens",      full_name: "Montreal Canadiens")
Team.create(abbreviation: "NSH", city: "Nashville",    name: "Predators",      full_name: "Nashville Predators")
Team.create(abbreviation: "NJD", city: "New Jersey",   name: "Devils",         full_name: "New Jersey Devils")
Team.create(abbreviation: "NYI", city: "New York",     name: "Islanders",      full_name: "New York Islanders")
Team.create(abbreviation: "NYR", city: "New York",     name: "Rangers",        full_name: "New York Rangers")
Team.create(abbreviation: "OTT", city: "Ottawa",       name: "Senators",       full_name: "Ottawa Senators")
Team.create(abbreviation: "PHI", city: "Philadelphia", name: "Flyers",         full_name: "Philadelphia Flyers")
Team.create(abbreviation: "PIT", city: "Pittsburgh",   name: "Penguins",       full_name: "Pittsburgh Penguins")
Team.create(abbreviation: "SEA", city: "Seattle",      name: "Kraken",         full_name: "Seattle Kraken")
Team.create(abbreviation: "SJS", city: "San Jose",     name: "Sharks",         full_name: "San Jose Sharks")
Team.create(abbreviation: "STL", city: "St. Louis",    name: "Blues",          full_name: "St. Louis Blues")
Team.create(abbreviation: "TBL", city: "Tampa Bay",    name: "Lightning",      full_name: "Tampa Bay Lightning")
Team.create(abbreviation: "TOR", city: "Toronto",      name: "Maple Leafs",    full_name: "Toronto Maple Leafs")
Team.create(abbreviation: "VAN", city: "Vancouver",    name: "Canucks",        full_name: "Vancouver Canucks")
Team.create(abbreviation: "VGK", city: "Vegas",        name: "Golden Knights", full_name: "Vegas Golden Knights")
Team.create(abbreviation: "WSH", city: "Washington",   name: "Capitals",       full_name: "Washington Capitals")
Team.create(abbreviation: "WPG", city: "Winnipeg",     name: "Jets",           full_name: "Winnipeg Jets")

puts "Creating season, team combinations..."

season_ids = Season.pluck(:id)
team_ids = Team.pluck(:id)

season_ids.product(team_ids).each do |sid, tid|
  SeasonTeam.create(season_id: sid, team_id: tid)
end

puts "Creating games..."

CSV_PATH = File.join(Rails.root, 'db', 'game_dump.csv')
GameCSVImporter.new(CSV_PATH).import
