require_relative "../ntoidatamapper.rb"
# require File.join(File.expand_path(".."), "ntoidatamapper.rb")

def addSeason

  # Add 2014-2015 season
  Season.create(:seasonID => "20142015")
  puts 'Added 2014-2015 season to database.'

  # Add 2014-2015 season for all teams
  teams = Team.all
  teams.each do |t|
    if t.teamID != "ATL"
      t.seasons << Season.first(:seasonID => "20142015")
      t.save
    end
  end
  puts 'Added 2014-2015 season to teams.'

end

# Check if executing this script in command line
if __FILE__ == $0
  addSeason()
end