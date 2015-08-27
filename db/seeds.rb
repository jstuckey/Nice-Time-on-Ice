puts "Creating seasons..."

Season.create(year_start: 2011, year_end: 2012)
Season.create(year_start: 2012, year_end: 2013)
Season.create(year_start: 2013, year_end: 2014)
Season.create(year_start: 2014, year_end: 2015)

puts "Creating teams..."

Team.create(name: "Anaheim Ducks",         abbreviation: "ANA")
Team.create(name: "Arizona Coyotes",       abbreviation: "ARI")
Team.create(name: "Boston Bruins",         abbreviation: "BOS")
Team.create(name: "Buffalo Sabres",        abbreviation: "BUF")
Team.create(name: "Calgary Flames",        abbreviation: "CGY")
Team.create(name: "Carolina Hurricanes",   abbreviation: "CAR")
Team.create(name: "Chicago Blackhawks",    abbreviation: "CHI")
Team.create(name: "Colorado Avalanche",    abbreviation: "COL")
Team.create(name: "Columbus Blue Jackets", abbreviation: "CBJ")
Team.create(name: "Dallas Stars",          abbreviation: "DAL")
Team.create(name: "Detroit Red Wings",     abbreviation: "DET")
Team.create(name: "Edmonton Oilers",       abbreviation: "EDM")
Team.create(name: "Florida Panthers",      abbreviation: "FLA")
Team.create(name: "Los Angeles Kings",     abbreviation: "LAK")
Team.create(name: "Minnesota Wild",        abbreviation: "MIN")
Team.create(name: "Montreal Canadiens",    abbreviation: "MTL")
Team.create(name: "Nashville Predators",   abbreviation: "NSH")
Team.create(name: "New Jersey Devils",     abbreviation: "NJD")
Team.create(name: "New York Islanders",    abbreviation: "NYI")
Team.create(name: "New York Rangers",      abbreviation: "NYR")
Team.create(name: "Ottawa Senators",       abbreviation: "OTT")
Team.create(name: "Philadelphia Flyers",   abbreviation: "PHI")
Team.create(name: "Pittsburgh Penguins",   abbreviation: "PIT")
Team.create(name: "San Jose Sharks",       abbreviation: "SJS")
Team.create(name: "St. Louis Blues",       abbreviation: "STL")
Team.create(name: "Tampa Bay Lightning",   abbreviation: "TBL")
Team.create(name: "Toronto Maple Leafs",   abbreviation: "TOR")
Team.create(name: "Vancouver Canucks",     abbreviation: "VAN")
Team.create(name: "Washington Capitals",   abbreviation: "WSH")
Team.create(name: "Winnipeg Jets",         abbreviation: "WPG")

puts "Creating season, team combinations..."

season_ids = Season.pluck(:id)
team_ids = Team.pluck(:id)

season_ids.product(team_ids).each do |sid, tid|
  SeasonTeam.create(season_id: sid, team_id: tid)
end

puts "Creating games..."

CSV_PATH = File.join(Rails.root, 'db', 'game_dump.csv')
GameCSVImporter.new(CSV_PATH).import

