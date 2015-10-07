json.gameID   game.game_number.to_s
json.date     game.date.strftime("%a %b %d, %Y")
json.awayTeam game.away_team.name
json.homeTeam game.home_team.name
json.gameType (game.playoffs? ? "Playoffs" : "Regular")
