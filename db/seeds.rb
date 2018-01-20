puts "Creating seasons..."

Season.create(year_start: 2011, year_end: 2012)
Season.create(year_start: 2012, year_end: 2013)
Season.create(year_start: 2013, year_end: 2014)
Season.create(year_start: 2014, year_end: 2015)
Season.create(year_start: 2015, year_end: 2016)
Season.create(year_start: 2016, year_end: 2017)
Season.create(year_start: 2017, year_end: 2018)

puts "Creating teams..."

Team.create(city: "Anaheim ",      name: "Ducks",          abbreviation: "ANA")
Team.create(city: "Arizona ",      name: "Coyotes",        abbreviation: "ARI")
Team.create(city: "Boston ",       name: "Bruins",         abbreviation: "BOS")
Team.create(city: "Buffalo ",      name: "Sabres",         abbreviation: "BUF")
Team.create(city: "Calgary ",      name: "Flames",         abbreviation: "CGY")
Team.create(city: "Carolina ",     name: "Hurricanes",     abbreviation: "CAR")
Team.create(city: "Chicago ",      name: "Blackhawks",     abbreviation: "CHI")
Team.create(city: "Colorado ",     name: "Avalanche",      abbreviation: "COL")
Team.create(city: "Columbus ",     name: "Blue Jackets",   abbreviation: "CBJ")
Team.create(city: "Dallas ",       name: "Stars",          abbreviation: "DAL")
Team.create(city: "Detroit ",      name: "Red Wings",      abbreviation: "DET")
Team.create(city: "Edmonton ",     name: "Oilers",         abbreviation: "EDM")
Team.create(city: "Florida ",      name: "Panthers",       abbreviation: "FLA")
Team.create(city: "Los Angeles",   name: "Kings",          abbreviation: "LAK")
Team.create(city: "Minnesota ",    name: "Wild",           abbreviation: "MIN")
Team.create(city: "Montreal ",     name: "Canadiens",      abbreviation: "MTL")
Team.create(city: "Nashville ",    name: "Predators",      abbreviation: "NSH")
Team.create(city: "New Jersey",    name: "Devils",         abbreviation: "NJD")
Team.create(city: "New York",      name: "Islanders",      abbreviation: "NYI")
Team.create(city: "New York",      name: "Rangers",        abbreviation: "NYR")
Team.create(city: "Ottawa ",       name: "Senators",       abbreviation: "OTT")
Team.create(city: "Philadelphia ", name: "Flyers",         abbreviation: "PHI")
Team.create(city: "Pittsburgh ",   name: "Penguins",       abbreviation: "PIT")
Team.create(city: "San Jose",      name: "Sharks",         abbreviation: "SJS")
Team.create(city: "St. Louis",     name: "Blues",          abbreviation: "STL")
Team.create(city: "Tampa Bay",     name: "Lightning",      abbreviation: "TBL")
Team.create(city: "Toronto ",      name: "Maple Leafs",    abbreviation: "TOR")
Team.create(city: "Vancouver ",    name: "Canucks",        abbreviation: "VAN")
Team.create(city: "Vegas ",        name: "Golden Knights", abbreviation: "VGK")
Team.create(city: "Washington ",   name: "Capitals",       abbreviation: "WSH")
Team.create(city: "Winnipeg ",     name: "Jets",           abbreviation: "WPG")

puts "Creating season, team combinations..."

season_ids = Season.pluck(:id)
team_ids = Team.pluck(:id)

season_ids.product(team_ids).each do |sid, tid|
  SeasonTeam.create(season_id: sid, team_id: tid)
end

puts "Creating games..."

CSV_PATH = File.join(Rails.root, 'db', 'game_dump.csv')
GameCSVImporter.new(CSV_PATH).import
