require_relative "../ntoidatamapper.rb"
# require File.join(File.expand_path(".."), "ntoidatamapper.rb")

def addSeason

  # Add 2013-2014 season
  Season.create(:seasonID => "20132014")
  puts 'Added 2013-2014 season to database.'

  # Add 2013-2014 season for all teams
  teams = Team.all
  teams.each do |t|
    if t.teamID != "ATL"
      t.seasons << Season.first(:seasonID => "20132014")
      t.save
    end
  end
  puts 'Added 2013-2014 season to teams.'

end

# Check if executing this script in command line
if __FILE__ == $0
  addSeason()
end