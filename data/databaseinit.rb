require_relative "../ntoidatamapper.rb"
# require File.join(File.expand_path(".."), "ntoidatamapper.rb")

def initDatabase

  # Add conferences
  Conference.create(:name => "Eastern")
  Conference.create(:name => "Western")
  puts "Added conferences to database."

  # Add divisions
  easternConference = Conference.first(:name => "Eastern")
  westernConference = Conference.first(:name => "Western")

  Division.create(:name => "Southeast", :conference => easternConference)
  Division.create(:name => "Atlantic", :conference => easternConference)
  Division.create(:name => "Northeast", :conference => easternConference)
  Division.create(:name => "Central", :conference => westernConference)
  Division.create(:name => "Pacific", :conference => westernConference)
  Division.create(:name => "Northwest", :conference => westernConference)
  puts "Added divisions to database."

  # Add seasons
  Season.create(:seasonID => "20072008")
  Season.create(:seasonID => "20082009")
  Season.create(:seasonID => "20092010")
  Season.create(:seasonID => "20102011")
  Season.create(:seasonID => "20112012")
  Season.create(:seasonID => "20122013")
  Season.create(:seasonID => "20132014")
  puts 'Added seasons to database.'

  # Add teams
  southeastDivision = Division.first(:name => "Southeast")
  atlanticDivision = Division.first(:name => "Atlantic")
  northeastDivision = Division.first(:name => "Northeast")
  centralDivision = Division.first(:name => "Central")
  pacificDivision = Division.first(:name => "Pacific")
  northwestDivision = Division.first(:name => "Northwest")

  Team.create(:name => "Anaheim Ducks", :teamID => "ANA", :division => pacificDivision)
  Team.create(:name => "Atlanta Thrashers", :teamID => "ATL", :division => southeastDivision)
  Team.create(:name => "Boston Bruins", :teamID => "BOS", :division => northeastDivision)
  Team.create(:name => "Buffalo Sabres", :teamID => "BUF", :division => northeastDivision)
  Team.create(:name => "Calgary Flames", :teamID => "CGY", :division => northwestDivision)
  Team.create(:name => "Carolina Hurricanes", :teamID => "CAR", :division => southeastDivision)
  Team.create(:name => "Chicago Blackhawks", :teamID => "CHI", :division => centralDivision)
  Team.create(:name => "Colorado Avalanche", :teamID => "COL", :division => northwestDivision)
  Team.create(:name => "Columbus Bluejackets", :teamID => "CBJ", :division => centralDivision)
  Team.create(:name => "Dallas Stars", :teamID => "DAL", :division => pacificDivision)
  Team.create(:name => "Detroit Red Wings", :teamID => "DET", :division => centralDivision)
  Team.create(:name => "Edmonton Oilers", :teamID => "EDM", :division => northwestDivision)
  Team.create(:name => "Florida Panthers", :teamID => "FLA", :division => southeastDivision)
  Team.create(:name => "Los Angeles Kings", :teamID => "LAK", :division => pacificDivision)
  Team.create(:name => "Minnesota Wild", :teamID => "MIN", :division => northwestDivision)
  Team.create(:name => "Montreal Canadiens", :teamID => "MTL", :division => northeastDivision)
  Team.create(:name => "Nashville Predators", :teamID => "NSH", :division => centralDivision)
  Team.create(:name => "New Jersey Devils", :teamID => "NJD", :division => atlanticDivision)
  Team.create(:name => "New York Islanders", :teamID => "NYI", :division => atlanticDivision)
  Team.create(:name => "New York Rangers", :teamID => "NYR", :division => atlanticDivision)
  Team.create(:name => "Ottawa Senators", :teamID => "OTT", :division => northeastDivision)
  Team.create(:name => "Philadelphia Flyers", :teamID => "PHI", :division => atlanticDivision)
  Team.create(:name => "Phoenix Coyotes", :teamID => "PHX", :division => pacificDivision)
  Team.create(:name => "Pittsburgh Penguins", :teamID => "PIT", :division => atlanticDivision)
  Team.create(:name => "San Jose Sharks", :teamID => "SJS", :division => pacificDivision)
  Team.create(:name => "St. Louis Blues", :teamID => "STL", :division => centralDivision)
  Team.create(:name => "Tampa Bay Lightning", :teamID => "TBL", :division => southeastDivision)
  Team.create(:name => "Toronto Maple Leafs", :teamID => "TOR", :division => northeastDivision)
  Team.create(:name => "Vancouver Canucks", :teamID => "VAN", :division => northwestDivision)
  Team.create(:name => "Washington Capitals", :teamID => "WSH", :division => southeastDivision)
  Team.create(:name => "Winnipeg Jets", :teamID => "WPG", :division => southeastDivision)
  puts 'Added teams to database.'
  puts 'Go Caps!'

  # Add seasons to teams
  teams = Team.all
  seasons = Season.all

  teams.each do |t|
    if t.teamID == "ATL"
      t.seasons.concat(Season.all(:seasonID.not => "20112012"))
    elsif t.teamID == 'WPG'
      t.seasons << Season.first(:seasonID => "20112012")
    else
      t.seasons.concat(seasons)
    end

    t.save
  end
  puts 'Added seasons to teams.'

end

# Check if executing this script in command line
if __FILE__ == $0
  initDatabase
end