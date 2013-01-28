require_relative "../ntoidatamapper.rb"


def getAllGames
  allGames = Array.new
  gameNumberToAdd = 2012020001
  lastGameNumber = Season.all(:seasonID => '20122013').games.all(:order => :gameID).last.gameID.to_i
  
  # Add game numbers to array
  while gameNumberToAdd <= lastGameNumber do
    allGames << gameNumberToAdd.to_s
    gameNumberToAdd += 1
  end
  
  allGames
end


def getDatabaseGames
  allGamesInDatabase = Array.new
  games = Season.all(:seasonID => '20122013').games.all(:order => :gameID)
  
  games.each do |g|
    allGamesInDatabase << g.gameID
  end
  
  puts "Games in database:"
  puts 
  allGamesInDatabase.each do |g|
    puts g
  end
  puts ""
  
  allGamesInDatabase
end

puts
puts 'Getting games for the 2012-2013 season...'
puts

# Get array of games
gamesInDatabase = getDatabaseGames()
allGames = getAllGames()
missingGames = Array.new

# Check for missing games
puts "Checking for missing games..."
puts

allGames.each do |game|
  if !gamesInDatabase.include?(game)
    missingGames << game
  end
end

# Check if missing games were found
if missingGames.length > 0
  puts "Missing games as of #{Season.all(:seasonID => '20122013').games.all(:order => :gameID).last.date}:"
  missingGames.each do |mg|
    puts mg
  end
else 
  puts "No missing games as of #{Season.all(:seasonID => '20122013').games.all(:order => :gameID).last.date}."
  puts
end