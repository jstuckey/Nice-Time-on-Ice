require File.join(File.expand_path(".."), "ntoidatamapper.rb")

season = Season.get(1)

games = season.games

puts games.count

games = games.all(Game.awayTeam.teamID => 5)

puts games.count

games = season.games
games = games.all(Game.homeTeam.teamID => 29)

puts games.count

games = season.games
games1 = games.all(Game.awayTeam.teamID => 5)
games2 = games.all(Game.homeTeam.teamID => 29)
games = games1 & games2

puts games.count