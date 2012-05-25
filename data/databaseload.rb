require_relative "../ntoidatamapper.rb"
require_relative "databaseinit.rb"
# require File.join(File.expand_path(".."), "ntoidatamapper.rb")
# require 'databaseinit.rb'

# Check if the database has been initialized
if Team.count <= 0
  initDatabase
end

# Check if calling this script from the data folder or the project root
if Dir.pwd.include? "/data"
  # Open game scrape file from this directory
  scrapeFile = File.open("gamescrape.txt")
else
  # Open game scrape file from data directory
  scrapeFile = File.open(File.expand_path("data/gamescrape.txt", Dir.pwd)) 
end

# Loop through each line of the scrape file
scrapeFile.each do |line|
  # Split data by the delimiter  
  gameData = line.split('***')
  season = gameData[0]
  gameType = gameData[1]
  awayTeamAbbreviation = gameData[2]
  homeTeamAbbreviation = gameData[3]
  date = gameData[4]
  gameNumber = gameData[5].gsub(/\n/, "")
  
  # Add game
  newGame = Game.create(:gameID => gameNumber, :date => date, :gameType => gameType)
  
  # Add game to season
  currentSeason = Season.first(:seasonID => season)
  currentSeason.games << newGame
  currentSeason.save
  
  # Get participating teams
  awayTeam = Team.first(:teamID => awayTeamAbbreviation)
  homeTeam = Team.first(:teamID => homeTeamAbbreviation)
  
  # Set teams for added game
  newGame.awayTeam = awayTeam
  newGame.homeTeam = homeTeam
  newGame.save
  
  puts "Added to database #{line}"
end

scrapeFile.close
