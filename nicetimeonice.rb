require 'rubygems'
require 'sinatra'
require 'json'

require_relative 'ntoidatamapper.rb'
require_relative 'configure.rb'
require_relative 'helpers.rb'

# ---------------
# - View Routes -
# ---------------

# Default view - populates seasons and teams
get '/' do
  seasons = allSeasons
  teams = allTeams
  
  erb :home, :locals => { :seasons => seasons, :teams => teams, :script => "siteActions.js", :style => "siteStyle.css", :titleAddition => "" }
end

# Games view - all games in a season for a team
# Supported query string parameters: awayTeam, homeTeam, team, order
get '/seasons/:seasonID/games' do
  
  # Get parameters
  seasonID = params[:seasonID]
  team = params[:team]
  homeTeam = params[:homeTeam]
  awayTeam = params[:awayTeam]
  gameType = params[:gameType]
  sortOrder = params[:order]
  
  # Check which query string parameters were passed in
  if hasValue(team) 
    games = allGamesForSeasonAndTeam(seasonID, team, gameType, sortOrder)
  elsif hasValue(awayTeam) || hasValue(homeTeam)
    games = allGameForSeasonAndHomeAwayTeam(seasonID, homeTeam, awayTeam, gameType, sortOrder)
  else
    games = allGamesForSeason(seasonID, gameType, sortOrder)
  end
  
  erb :games, :layout => (request.xhr? ? false : :layout), :locals => { :games => games }
end

# Season Links view
get '/teams/:teamID/seasons/:seasonID/links' do
  links = seasonLinks(params[:teamID], params[:seasonID], params[:gameType])
  erb :links, :layout => (request.xhr? ? false : :layout), :locals => { :links => links }
end

# Game Links view
get '/seasons/:seasonID/games/:gameID/links' do
  links = gameLinks(params[:seasonID], params[:gameID])
  erb :links, :layout => (request.xhr? ? false : :layout), :locals => { :links => links }
end

get '/api' do
  apiResources = getAPIResources
  erb :api, :locals => { :apiResources => apiResources, :script => "apiActions.js", :style => "apiStyle.css", :titleAddition => " API" }
end

# --------------
# - API Routes -
# --------------

# All seasons
get '/api/seasons' do
  
  seasons = allSeasons
  
  content_type :json
  returnJSON = Array.new
  if seasons
    seasons.each do |s|
      returnJSON << {:seasonID => "#{s.seasonID}"}
    end  
  end
  
  returnJSON.to_json
end

# Specific season
get '/api/seasons/:seasonID' do
  
  season = specificSeason(params[:seasonID])
  
  content_type :json
  if season
    returnJSON = {:seasonID => "#{season.seasonID}"}
  else
    returnJSON = Hash.new
  end
  
  returnJSON.to_json
end

# All games in a season
# Supported query string params: awayTeam, homeTeam, team, order
get '/api/seasons/:seasonID/games' do
  
  # Get parameters
  seasonID = params[:seasonID]
  team = params[:team]
  homeTeam = params[:homeTeam]
  awayTeam = params[:awayTeam]
  gameType = params[:gameType]
  sortOrder = params[:order]
  
  # Check which query string parameters were passed in
  if hasValue(team)
    games = allGamesForSeasonAndTeam(seasonID, team, gameType, sortOrder)
  elsif hasValue(awayTeam) || hasValue(homeTeam)
    games = allGameForSeasonAndHomeAwayTeam(seasonID, homeTeam, awayTeam, gameType, sortOrder)
  else
    games = allGamesForSeason(seasonID, gameType, sortOrder)
  end
  
  content_type :json
  returnJSON = Array.new
  if games
    games.each do |g|
      returnJSON << {:gameID => "#{g.gameID}", :date => "#{g.date}", :awayTeam => "#{g.awayTeam.name}", :homeTeam => "#{g.homeTeam.name}", :gameType => "#{g.gameType}" }
    end
  end
  
  returnJSON.to_json
end

# Specific game in a season
get '/api/seasons/:seasonID/games/:gameID' do
  
  game = specificGameInSeason(params[:seasonID], params[:gameID])
  
  content_type :json
  if game
    returnJSON = {:gameID => "#{game.gameID}", :date => "#{game.date}", :awayTeam => "#{game.awayTeam.name}", :homeTeam => "#{game.homeTeam.name}", :gameType => "#{game.gameType}" }
  else
    returnJSON = Hash.new
  end
  
  returnJSON.to_json
end

# Links for specific game in a season
get '/api/seasons/:seasonID/games/:gameID/links' do
  
  links = gameLinks(params[:seasonID], params[:gameID])
  
  content_type :json
  returnJSON = Array.new
  if links
    links.each do |l|
      returnJSON << {:description => "#{l.description}", :site => "#{l.site}", :link => "#{l.link}" }
    end
  end
  
  returnJSON.to_json
end

# All teams
get '/api/teams' do
  
  division = params[:division]
  conference = params[:conference]
  
  if hasValue(division)
    teams = allTeamsInDivision(division)
  elsif hasValue(conference)
    teams = allTeamsInConference(conference)
  else
    teams = allTeams
  end
  
  content_type :json
  returnJSON = Array.new
  if teams
    teams.each do |t|
      returnJSON << {:name => "#{t.name}", :teamID => "#{t.teamID}", :conference => "#{t.division.conference.name}", :division => "#{t.division.name}" }
    end
  end
  
  returnJSON.to_json
end

# Specific team
get '/api/teams/:teamID' do
  
  team = specificTeam(params[:teamID])
  
  content_type :json
  if team
    returnJSON = {:name => "#{team.name}", :teamID => "#{team.teamID}", :conference => "#{team.division.conference.name}", :division => "#{team.division.name}" }
  else
    returnJSON = Hash.new
  end
  
  returnJSON.to_json
end

# All seasons for specific team
get '/api/teams/:teamID/seasons' do
  
  seasons = allSeasonsForTeam(params[:teamID])
  
  content_type :json
  returnJSON = Array.new
  if seasons
    seasons.each do |s|
      returnJSON << {:seasonID => "#{s.seasonID}"}
    end
  end
  
  returnJSON.to_json
end

# Specific season for specific team
get '/api/teams/:teamID/seasons/:seasonID' do
  
  season = specificSeasonForTeam(params[:teamID], params[:seasonID])
  
  content_type :json
  if season
    returnJSON = {:seasonID => "#{season.seasonID}"}
  else 
    returnJSON = Hash.new
  end
  
  returnJSON.to_json
end

# Links for a specific season and team
get '/api/teams/:teamID/seasons/:seasonID/links' do
  
  links = seasonLinks(params[:teamID], params[:seasonID], params[:gameType])
  
  content_type :json
  returnJSON = Array.new
  if links
    links.each do |l|
      returnJSON << {:description => "#{l.description}", :site => "#{l.site}", :link => "#{l.link}" }
    end
  end
  
  returnJSON.to_json
end

# ----------
# - Errors -
# ----------

not_found do  
  status 404  
  
  error = "404 - Resouce Not Found<br><br>"
  
  index = Time.new.sec % 6
  if index == 0
    error = error + "The resource you are looking for is a healty scratch. Try looking in the press box."
  elsif index == 1
    error = error + "The resource you are looking for was demoted to the AHL. Hopefully it clears waivers."
  elsif index == 2
    error = error + "The resource you are looking for is in the penalty box. Hopefully the PK bails it out."
  elsif index == 3
    error = error + "The resource you are looking for is on LTIR. At least there is an open roster spot."
  elsif index == 4
    error = error + "The resource you are looking for is suspended. The league is cracking down on hits to the head."
  elsif index == 5
    error = error + "The resource you are looking is benched. The coach is not happy with its performance."
  end 
  
  erb :error, :locals => { :error => error }
end

error do
  error = "<br><br>" + env['sinatra.error'].name
  
  index = Time.new.sec % 3
  if index == 0
    error = "Two minute minor. An error will be sent to the box for high-sticking." + error
  elsif index == 1
    error =  "Puck out of play. An error caused the puck to deflect over the glass." + error
  elsif index == 2
    error =  "Offsides. An error occurred before the puck entered the zone." + error
  end
  
  erb :error, :locals => { :error => error }
end