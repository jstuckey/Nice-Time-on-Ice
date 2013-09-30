require_relative "../ntoidatamapper.rb"

puts
puts "Checking for duplicate games..."
puts

allGames = Season.all(:seasonID => '20132014').games.all

duplicateGameIDs = Array.new

# Loop through games and check for duplicates
allGames.each do |game|
  if allGames.all(:gameID => game.gameID).count > 1 && !duplicateGameIDs.include?(game.gameID)
    puts "Found duplicate " + game.gameID
    duplicateGameIDs << game.gameID
  end
end



if duplicateGameIDs.length > 0

  puts
  puts "Removing duplicate games..."
  puts

  # Loop through duplicates and remove one copy of the game
  duplicateGameIDs.each do |gameID|
    gameToRemove = Game.all(:gameID => gameID)

    # Remove game from database
    if gameToRemove.count > 1
      gameToRemove = gameToRemove.last
      puts "Removing game #{gameToRemove.gameID}, #{gameToRemove.dmID}"
      gameToRemove.destroy
    end
  end
else
  puts "No duplicate games found."
  puts
end

