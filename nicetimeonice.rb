require 'rubygems'
require 'sinatra'
require 'json'
require_relative 'ntoidatamapper.rb'
# require 'ntoidatamapper.rb'

configure :production do
  require 'newrelic_rpm'
end

configure do
  # Constants
  CURRENTSEASON = "20122013"
  
  # HTML Classes
  SEASONLINKCLASS = "season" 
  TEAMLINKCLASS = "team"
  GAMELINKCLASS = "game"
  SITELINKCLASS = "link"
  
  class Link
    attr_accessor :site
    attr_accessor :description
    attr_accessor :link
    
    def initialize(site, description, link)
      @site = site
      @description = description
      @link = link
    end
  end
  
  class APIResource
    attr_accessor :path
    attr_accessor :queryString
    attr_accessor :description
    attr_accessor :inputs
    attr_accessor :inputDescriptions
    attr_accessor :queryStringStartIndex
    
    def initialize(path, queryString, description, inputs, inputDescriptions)
      @path = path
      @queryString = queryString
      @description = description
      @inputs = inputs
      @inputDescriptions = inputDescriptions
      @queryStringStartIndex = path.count '{'
    end
  end
  
end

helpers do
  
  def allSeasons
    @seasons = Season.all :order => :seasonID.desc
  end
  
  def specificSeason(seasonID)
    @season = Season.first(:seasonID => seasonID)
  end
  
  def allGamesForSeason(seasonID, gameType, order)
    @season = Season.first(:seasonID => seasonID)
    
    # Check if season is valid
    if @season
      # Check if the order parameter was passed in
      if order && order.strip.length > 0
        if order.upcase == "DESC"
          @games = @season.games :order => :gameID.desc
        else
          @games = @season.games :order => :gameID
        end
      else
        @games = @season.games :order => :gameID.desc 
      end
      
      # Check if games is valid
      if @games
        # Check if the gameType parameter was passed in
        if gameType && gameType.strip.length > 0
          @games = @games.all(:gameType => gameType.capitalize)
        end
      end
      
    end
  end
  
  def allGamesForSeasonAndTeam(seasonID, teamID, gameType, order)
    @season = Season.first(:seasonID => seasonID)
    
    # Check if season is valid
    if @season
      # Check if the order parameter was passed in
      if order && order.strip.length > 0
        if order.upcase == "DESC"
          allGames = @season.games :order => :gameID.desc
        else
          allGames = @season.games :order => :gameID
        end
      else
        allGames = @season.games :order => :gameID.desc 
      end
      
      games1 = allGames.all(Game.awayTeam.teamID => teamID.upcase)
      games2 = allGames.all(Game.homeTeam.teamID => teamID.upcase)
      @games = games1 | games2
      
      # Check if games is valid
      if @games
        # Check if the gameType parameter was passed in
        if gameType && gameType.strip.length > 0
          @games = @games.all(:gameType => gameType.capitalize)
        end
      end
    end
  end
  
  def allGameForSeasonAndHomeAwayTeam(seasonID, homeTeamID, awayTeamID, gameType, order)    
    @season = Season.first(:seasonID => seasonID)
    
    # Check if season is valid
    if @season
      # Check if the order parameter was passed in
      if order && order.strip.length > 0
        if order.upcase == "DESC"
          allGames = @season.games :order => :gameID.desc
        else
          allGames = @season.games :order => :gameID
        end
      else
        allGames = @season.games :order => :gameID.desc 
      end
      
      # Check if away team and home team are set
      if awayTeamID.strip.length <= 0
        awayTeamID = nil
      end
      if homeTeamID.strip.length <= 0
        homeTeamID = nil
      end
      
      # Check if home team and/or away team was specified
      if awayTeamID && !homeTeamID
        @games = allGames.all(Game.awayTeam.teamID => awayTeamID.upcase)
      elsif homeTeamID && !awayTeamID
        @games = allGames.all(Game.homeTeam.teamID => homeTeamID.upcase)
      elsif awayTeamID && homeTeamID
        games1 = allGames.all(Game.awayTeam.teamID => awayTeamID.upcase)
        games2 = allGames.all(Game.homeTeam.teamID => homeTeamID.upcase)
        @games = games1 & games2
      end
      
      # Check if games is valid
      if @games
        # Check if the gameType parameter was passed in
        if gameType && gameType.strip.length > 0
          @games = @games.all(:gameType => gameType.capitalize)
        end
      end
    end
  end
  
  def specificGameInSeason(seasonID, gameID)
    @season = Season.first(:seasonID => seasonID)
    # Check if season is valid
    if @season
      @game =  @season.games.first(:gameID => gameID)
    end
  end
  
  def allTeams
    @teams = Team.all :order => :name
  end
  
  def allTeamsInConference(conference)
    @teams = Team.all(Team.division.conference.name => conference.capitalize, :order => :name)
  end
  
  def allTeamsInDivision(division)
    @teams = Team.all(Team.division.name => division.capitalize, :order => :name)
  end
  
  def specificTeam(teamID)
    @team = Team.first(:teamID => teamID.upcase)
  end
  
  def allSeasonsForTeam(teamID)
    @team = Team.first(:teamID => teamID.upcase)
    # Check if team is valie
    if @team
      @seasons = @team.seasons
    end
  end
  
  def specificSeasonForTeam(teamID, seasonID)
    @team = Team.first(:teamID => teamID.upcase)
    # Check if team is valie
    if @team
      @season = @team.seasons.first(:seasonID => seasonID)
    end
  end
  
  def wasTeamInPlayoffs(teamID, seasonID)
    # Get home playoff games for team and season (team in playoffs will have have least two home games)
    games = Season.first(:seasonID => seasonID).games.all(Game.homeTeam.teamID => teamID, :gameType => 'Playoffs')
    games.count > 0
  end
  
  def getSeasonLinks(teamID, seasonID, gameType)
    @links = Array.new
    
    specificSeasonForTeam(teamID, seasonID)
    
    # Make sure passed in team and season are valid
    if @team && @season
      year = @season.seasonID
      teamAbbrev = @team.teamID
      gameTypeNumber = "2"
      
      # Check if gameType is playoffs
      if gameType && gameType.capitalize == 'Playoffs'
        # Check if team was in the playoffs for this season
        if wasTeamInPlayoffs(teamAbbrev, year)
          gameTypeNumber = "3"
        else
          # Requested playoff links for team that was not in playoffs
          return @links
        end
      end
      
      newLink = Link.new("NHL.com", "Summary", "http://www.nhl.com/ice/playerstats.htm?season=#{year}&gameType=#{gameTypeNumber}&team=#{teamAbbrev}&position=S&country=&status=&viewName=summary")
      @links << newLink
      newLink = Link.new("NHL.com", "Goals", "http://www.nhl.com/ice/playerstats.htm?gameType=#{gameTypeNumber}&position=S&season=#{year}&sort=goals&status=A&team=#{teamAbbrev}&viewName=goals")
      @links << newLink
      newLink = Link.new("NHL.com", "Assists", "http://www.nhl.com/ice/playerstats.htm?gameType=#{gameTypeNumber}&position=S&season=#{year}&sort=assists&status=A&team=#{teamAbbrev}&viewName=assists")
      @links << newLink
      newLink = Link.new("NHL.com", "Penalties", "http://www.nhl.com/ice/playerstats.htm?gameType=#{gameTypeNumber}&position=S&season=#{year}&sort=penaltyMinutes&status=A&team=#{teamAbbrev}&viewName=penalties")
      @links << newLink
      newLink = Link.new("NHL.com", "Special Teams", "http://www.nhl.com/ice/playerstats.htm?gameType=#{gameTypeNumber}&position=S&season=#{year}&sort=powerPlayGoals&status=A&team=#{teamAbbrev}&viewName=scoringLeaders")
      @links << newLink
      newLink = Link.new("NHL.com", "Faceoffs", "http://www.nhl.com/ice/playerstats.htm?gameType=#{gameTypeNumber}&position=S&season=#{year}&sort=totalFaceOffs&status=A&team=#{teamAbbrev}&viewName=faceOffPercentageAll")
      @links << newLink
      newLink = Link.new("NHL.com", "Time on Ice", "http://www.nhl.com/ice/playerstats.htm?gameType=#{gameTypeNumber}&position=S&season=#{year}&sort=timeOnIce&status=A&team=#{teamAbbrev}&viewName=timeOnIce")
      @links << newLink
      newLink = Link.new("Hockey-Reference", "Roster and Statistics", "http://www.hockey-reference.com/teams/#{teamAbbrev}/#{year[4,4]}.html")
      @links << newLink
      newLink = Link.new("Hockey-Reference", "Schedule and Results", "http://www.hockey-reference.com/teams/#{teamAbbrev}/#{year[4,4]}_games.html")
      @links << newLink
      newLink = Link.new("Behind the Net", "Player Breakdown", "http://www.behindthenet.ca/nhl_statistics.php?ds=30&f1=#{year[0,4]}_#{gameTypeNumber == "3" ? "p" : "s"}&f2=5v5&f5=#{fixBTNTeamName(teamAbbrev)}&c=0+1+3+5+2+4+6+7+10+8+11+12+13+14+15+16+17+18+19+20+21+22+23+24+25+26+27+28+32+33+34+29+30+31+35+36+37+38+39+40+47+48+49+50+51+52+53+54+55+56+63+67+57+58+59+60+61+62+64+65+66+41+42+43+44+45+46")
      @links << newLink
      newLink = Link.new("Behind the Net", "Player Shooting", "http://www.behindthenet.ca/nhl_shot_statistics.php?ds=13&f1=#{year[0,4]}_#{gameTypeNumber == "3" ? "p" : "s"}&f2=5v5&f5=#{fixBTNTeamName(teamAbbrev)}&c=0+1+3+5+4+7+8+9+10+11+12+13+14+15+16+17+18+19+20+21+22+23+24+25+26+27+28")
      @links << newLink
      newLink = Link.new("Behind the Net", "Linemates", "http://www.behindthenet.ca/nhl_time_on_ice_stats.php?ds=8&f1=#{year[0,4]}_#{gameTypeNumber == "3" ? "p" : "s"}&f2=5v5&f5=#{fixBTNTeamName(teamAbbrev)}&c=0+1+3+5+8+9+10+11+12+13+14+15+16+17+18+19+20+21+22+23+24+25+26+27+28")
      @links << newLink  
      newLink = Link.new("Some Kind of Ninja", "Player Usage Chart", "http://somekindofninja.com/nhl/usage.php?f1=#{year[0,4]}_#{gameTypeNumber == "3" ? "p" : "s"}&f2=5v5&f3=&f5=#{fixBTNTeamName(teamAbbrev)}&f4=&f7=&update-filters=Update+Results") 
      @links << newLink  
    end
    
    @links
  end
  
  def getGameLinks(seasonID, gameID)
    @links = Array.new
    
    specificGameInSeason(seasonID, gameID)

    # Make sure season and game are valid
    if (@season && @game)
      year = @season.seasonID
      gameNumber = @game.gameID
      
      newLink = Link.new("NHL.com", "Boxscore", "http://www.nhl.com/ice/boxscore.htm?id=#{gameNumber}")
      @links << newLink  
      newLink = Link.new("NHL.com", "Recap", "http://www.nhl.com/ice/recap.htm?id=#{gameNumber}")
      @links << newLink
      newLink = Link.new("NHL.com", "Ice Tracker", "http://www.nhl.com/ice/icetracker.htm?id=#{gameNumber}")
      @links << newLink
      newLink = Link.new("NHL.com", "Game Summary", "http://www.nhl.com/scores/htmlreports/#{year}/GS#{gameNumber[-6, 6]}.HTM")
      @links << newLink
      newLink = Link.new("NHL.com", "Event Summary", "http://www.nhl.com/scores/htmlreports/#{year}/ES#{gameNumber[-6, 6]}.HTM")
      @links << newLink
      newLink = Link.new("NHL.com", "Faceoff Summary", "http://www.nhl.com/scores/htmlreports/#{year}/FC#{gameNumber[-6, 6]}.HTM")
      @links << newLink
      newLink = Link.new("NHL.com", "Play-by-Play", "http://www.nhl.com/scores/htmlreports/#{year}/PL#{gameNumber[-6, 6]}.HTM")
      @links << newLink
      newLink = Link.new("NHL.com", "Home Time on Ice", "http://www.nhl.com/scores/htmlreports/#{year}/TH#{gameNumber[-6, 6]}.HTM")
      @links << newLink
      newLink = Link.new("NHL.com", "Away Time on Ice", "http://www.nhl.com/scores/htmlreports/#{year}/TV#{gameNumber[-6, 6]}.HTM")
      @links << newLink
      newLink = Link.new("NHL.com", "Playing Roster", "http://www.nhl.com/scores/htmlreports/#{year}/RO#{gameNumber[-6, 6]}.HTM")
      @links << newLink
      newLink = Link.new("NHL.com", "Shot Report", "http://www.nhl.com/scores/htmlreports/#{year}/SS#{gameNumber[-6, 6]}.HTM")
      @links << newLink
      newLink = Link.new("Time on Ice", "Shift Chart", "http://timeonice.com/#{year == CURRENTSEASON ? "default" : "SC" + year[2, 2] + year[-2, 2]}.html?GameNumber=#{gameNumber[-5, 5]}&submit=Go")
      @links << newLink
      newLink = Link.new("Time on Ice", "Head-to-Head", "http://timeonice.com/H2H#{year[2, 2] + year[-2, 2]}.html?GameNumber=#{gameNumber[-5, 5]}&submit=Go")
      @links << newLink
      newLink = Link.new("Time on Ice", "Fenwick/Corsi", "http://timeonice.com/shots#{year[2, 2] + year[-2, 2]}.php?gamenumber=#{gameNumber[-5, 5]}")
      @links << newLink
      newLink = Link.new("Time on Ice", "Zone Starts", "http://www.timeonice.com/faceoffs#{year[2, 2] + year[-2, 2]}.php?gamenumber=#{gameNumber[-5, 5]}")
      @links << newLink
      newLink = Link.new("Behind the Net", "Fenwick Timeline", "http://behindthenet.ca/charts/Shots_#{year[0,4]}_#{gameNumber[-5, 5]}.php")
      @links << newLink
    end

    @links
  end
  
  def fixBTNTeamName(teamName)
    # Handle funky team abbreviations for Behind the Net
    case teamName
    when "LAK" then "L.A"
    when "NJD" then "N.J"
    when "SJS" then "S.J"
    when "TBL" then "T.B"
    else teamName
    end
  end
  
  def getAPIResources
    @APIResources = Array.new
    
    # Build array of APIResource objects
    # Each APIResource object has a path, query string parameters, a description, an array of inputs, and an array of input descriptions
    
    inputs = Array.new
    inputDescs = Array.new
    newAPIResource = APIResource.new("/api/seasons", "", " Returns all available seasons as a JSON array", inputs, inputDescs)
    @APIResources << newAPIResource
    
    inputs = Array.new
    inputDescs = Array.new
    inputs << "seasonID"
    inputDescs << "A season number. Ex: 20112012"
    newAPIResource = APIResource.new("/api/seasons/{seasonID}", "", "Returns the specified season as a JSON object", inputs, inputDescs)
    @APIResources << newAPIResource
    
    inputs = Array.new
    inputDescs = Array.new
    inputs << "seasonID"
    inputs << "gameType"
    inputs << "order"
    inputs << "team"
    inputs << "awayTeam"
    inputs << "homeTeam"
    inputDescs << "A season number. Ex: 20112012"
    inputDescs << "A game type. Either Regular or Playoffs"
    inputDescs << "A game date sort order. Either ASC or DESC"
    inputDescs << "A team abbreviation. Ex: WSH"
    inputDescs << "A team abbreviation. Overriden by teamID. Ex: WSH"
    inputDescs << "A team abbreviation. Overriden by teamID. Ex: WSH"
    newAPIResource = APIResource.new("/api/seasons/{seasonID}/games", "gameType={gameType}&order={order}&team={team}&awayTeam={awayTeam}&homeTeam={homeTeam}", "Returns all games in a season as a JSON array", inputs, inputDescs)
    @APIResources << newAPIResource
    
    inputs = Array.new
    inputDescs = Array.new
    inputs << "seasonID"
    inputs << "gameID"
    inputDescs << "A season number. Ex: 20112012"
    inputDescs << "A game number. Ex: 2011021218"
    newAPIResource = APIResource.new("/api/seasons/{seasonID}/games/{gameID}", "", "Returns a specified game for the specified season as a JSON object", inputs, inputDescs)
    @APIResources << newAPIResource
    
    inputs = Array.new
    inputDescs = Array.new
    inputs << "seasonID"
    inputs << "gameID"
    inputDescs << "A season number. Ex: 20112012"
    inputDescs << "A game number. Ex: 2011021218"
    newAPIResource = APIResource.new("/api/seasons/{seasonID}/games/{gameID}/links", "", "Returns links for the specified game as a JSON array", inputs, inputDescs)
    @APIResources << newAPIResource
    
    inputs = Array.new
    inputs << "conference"
    inputs << "division"
    inputDescs = Array.new
    inputDescs << "A conference name. Ex: Eastern"
    inputDescs << "A division name. Ex: Southeast"
    newAPIResource = APIResource.new("/api/teams", "conference={conference}&division={division}", "Returns all available available teams as a JSON array", inputs, inputDescs)
    @APIResources << newAPIResource
    
    inputs = Array.new
    inputDescs = Array.new
    inputs << "teamID"
    inputDescs << "A team abbreviation. Ex: WSH"
    newAPIResource = APIResource.new("/api/teams/{teamID}", "", "Returns the specified team as a JSON object", inputs, inputDescs)
    @APIResources << newAPIResource
    
    inputs = Array.new
    inputDescs = Array.new
    inputs << "teamID"
    inputDescs << "A team abbreviation. Ex: WSH"
    newAPIResource = APIResource.new("/api/teams/{teamID}/seasons", "", "Returns all seasons for a specified team as a JSON array", inputs, inputDescs)
    @APIResources << newAPIResource
    
    inputs = Array.new
    inputDescs = Array.new
    inputs << "teamID"
    inputs << "seasonID"
    inputDescs << "A team abbreviation. Ex: WSH"
    inputDescs << "A season number. Ex: 20112012"
    newAPIResource = APIResource.new("/api/teams/{teamID}/seasons/{seasonID}", "", "Returns the specified season for a team as a JSON array", inputs, inputDescs)
    @APIResources << newAPIResource
    
    inputs = Array.new
    inputDescs = Array.new
    inputs << "teamID"
    inputs << "seasonID"
    inputs << "gameType"
    inputDescs << "A team abbreviation. Ex: WSH"
    inputDescs << "A season number. Ex: 20112012"
    inputDescs << "A game type. Either Regular or Playoffs"
    newAPIResource = APIResource.new("/api/teams/{teamID}/seasons/{seasonID}/links", "gameType={gameType}", "Returns links for the specified season as a JSON array", inputs, inputDescs)
    @APIResources << newAPIResource
    
    @APIResources
  end
  
end

# ---------
# - Views -
# ---------

# Default view - populates seasons and teams
get '/' do
  allSeasons
  allTeams
  @script = "actions.js"
  @style = "style.css"
  erb :home
end

# Games view - all games in a season for a team
# Supported query string parameters: awayTeam, homeTeam, team, order
get '/seasons/:seasonID/games' do
  # Check for query string parameters
  if params[:team] && params[:team].strip.length > 0 
    allGamesForSeasonAndTeam(params[:seasonID], params[:team], params[:gameType], params[:order])
  elsif (params[:awayTeam] && params[:awayTeam].strip.length > 0) || (params[:homeTeam] && params[:homeTeam].strip.length > 0)
    allGameForSeasonAndHomeAwayTeam(params[:seasonID], params[:homeTeam], params[:awayTeam], params[:gameType], params[:order])
  else
    allGamesForSeason(params[:seasonID], params[:gameType], params[:order])
  end
  
  erb :games, :layout => (request.xhr? ? false : :layout)
end

# Season Links view
get '/teams/:teamID/seasons/:seasonID/links' do
  getSeasonLinks(params[:teamID], params[:seasonID], params[:gameType])
  
  erb :links, :layout => (request.xhr? ? false : :layout)
end

# Game Links view
get '/seasons/:seasonID/games/:gameID/links' do
  getGameLinks(params[:seasonID], params[:gameID])
  
  erb :links, :layout => (request.xhr? ? false : :layout)
end

get '/api' do
  getAPIResources
  @titleAddition = " API"
  @script = "apiActions.js"
  @style = "apiStyle.css"
  erb :api
end

# -------
# - API -
# -------

# All seasons
get '/api/seasons' do
  allSeasons
  
  content_type :json
  returnJSON = Array.new
  if @seasons
    @seasons.each do |s|
      returnJSON << {:seasonID => "#{s.seasonID}"}
    end  
  end
  
  returnJSON.to_json
end

# Specific season
get '/api/seasons/:seasonID' do
  specificSeason(params[:seasonID])
  
  content_type :json
  if @season
    returnJSON = {:seasonID => "#{@season.seasonID}"}
  else
    returnJSON = Hash.new
  end
  
  returnJSON.to_json
end

# All games in a season
# Supported query string params: awayTeam, homeTeam, team, order
get '/api/seasons/:seasonID/games' do
  if params[:team] && params[:team].strip.length > 0
    allGamesForSeasonAndTeam(params[:seasonID], params[:team], params[:gameType], params[:order])
  elsif (params[:awayTeam] && params[:awayTeam].strip.length > 0) || (params[:homeTeam] && params[:homeTeam].strip.length > 0)
    allGameForSeasonAndHomeAwayTeam(params[:seasonID], params[:homeTeam], params[:awayTeam], params[:gameType], params[:order])
  else
    allGamesForSeason(params[:seasonID], params[:gameType], params[:order])
  end
  
  content_type :json
  returnJSON = Array.new
  if @games
    @games.each do |g|
      returnJSON << {:gameID => "#{g.gameID}", :date => "#{g.date}", :awayTeam => "#{g.awayTeam.name}", :homeTeam => "#{g.homeTeam.name}", :gameType => "#{g.gameType}" }
    end
  end
  
  returnJSON.to_json
end

# Specific game in a season
get '/api/seasons/:seasonID/games/:gameID' do
  specificGameInSeason(params[:seasonID], params[:gameID])
  
  content_type :json
  
  if @game
    returnJSON = {:gameID => "#{@game.gameID}", :date => "#{@game.date}", :awayTeam => "#{@game.awayTeam.name}", :homeTeam => "#{@game.homeTeam.name}", :gameType => "#{@game.gameType}" }
  else
    returnJSON = Hash.new
  end
  
  returnJSON.to_json
end

# Links for specific game in a season
get '/api/seasons/:seasonID/games/:gameID/links' do
  getGameLinks(params[:seasonID], params[:gameID])
  
  content_type :json
  returnJSON = Array.new
  if @links
    @links.each do |l|
      returnJSON << {:description => "#{l.description}", :site => "#{l.site}", :link => "#{l.link}" }
    end
  end
  
  returnJSON.to_json
end

# All teams
get '/api/teams' do
  
  if params[:division] && params[:division].strip.length > 0
    allTeamsInDivision(params[:division])
  elsif params[:conference] && params[:conference].strip.length > 0
    allTeamsInConference(params[:conference])
  else
    allTeams
  end
  
  content_type :json
  returnJSON = Array.new
  if @teams
    @teams.each do |t|
      returnJSON << {:name => "#{t.name}", :teamID => "#{t.teamID}", :conference => "#{t.division.conference.name}", :division => "#{t.division.name}" }
    end
  end
  
  returnJSON.to_json
end

# Specific team
get '/api/teams/:teamID' do
  specificTeam(params[:teamID])
  
  content_type :json
  if @team
    returnJSON = {:name => "#{@team.name}", :teamID => "#{@team.teamID}", :conference => "#{@team.division.conference.name}", :division => "#{@team.division.name}" }
  else
    returnJSON = Hash.new
  end
  
  returnJSON.to_json
end

# All seasons for specific team
get '/api/teams/:teamID/seasons' do
  allSeasonsForTeam(params[:teamID])
  
  content_type :json
  returnJSON = Array.new
  if @seasons
    @seasons.each do |s|
      returnJSON << {:seasonID => "#{s.seasonID}"}
    end
  end
  
  returnJSON.to_json
end

# Specific season for specific team
get '/api/teams/:teamID/seasons/:seasonID' do
  specificSeasonForTeam(params[:teamID], params[:seasonID])
  
  content_type :json
  if @season
    returnJSON = {:seasonID => "#{@season.seasonID}"}
  else 
    returnJSON = Hash.new
  end
  
  returnJSON.to_json
end

# Links for a specific season and team
get '/api/teams/:teamID/seasons/:seasonID/links' do
  getSeasonLinks(params[:teamID], params[:seasonID], params[:gameType])
  
  content_type :json
  returnJSON = Array.new
  if @links
    @links.each do |l|
      returnJSON << {:description => "#{l.description}", :site => "#{l.site}", :link => "#{l.link}" }
    end
  end
  
  returnJSON.to_json
end

not_found do  
  status 404  
  
  @error = "404 - Resouce Not Found<br><br>"
  
  index = Time.new.sec % 6
  if index == 0
    @error = @error + "The resource you are looking for is a healty scratch. Try looking in the press box."
  elsif index == 1
    @error = @error + "The resource you are looking for was demoted to the AHL. Hopefully it clears waivers."
  elsif index == 2
    @error = @error + "The resource you are looking for is in the penalty box. Hopefully the PK bails it out."
  elsif index == 3
    @error = @error + "The resource you are looking for is on LTIR. At least there is an open roster spot."
  elsif index == 4
    @error = @error + "The resource you are looking for is suspended. The league is cracking down on hits to the head."
  elsif index == 5
    @error = @error + "The resource you are looking is benched. The coach is not happy with its performance."
  end 
  
  erb :error
end

error do
  @error = "<br><br>" + env['sinatra.error'].name
  
  index = Time.new.sec % 3
  if index == 0
    @error = "Two minute minor. An error will be sent to the box for high-sticking." + @error
  elsif index == 1
    @error =  "Puck out of play. An error caused the puck to deflect over the glass." + @error
  elsif index == 2
    @error =  "Offsides. An error occurred before the puck entered the zone." + @error
  end
  
  erb :error
end