# -------------------
# - Sinatra Helpers -
# -------------------

helpers do

  # -----------
  # - Seasons -
  # -----------

  def allSeasons
    return Season.all :order => :seasonID.desc
  end

  def allSeasonsForTeam(teamID)

    if hasValue(teamID)
      teamID.strip!
    end

    team = Team.first(:teamID => teamID.upcase)
    if team
      seasons = team.seasons
    end

    return seasons
  end

  def specificSeason(seasonID)

    if hasValue(seasonID)
      seasonID.strip!
    end

    return Season.first(:seasonID => seasonID)
  end

  def specificSeasonForTeam(teamID, seasonID)

    if hasValue(teamID)
      teamID.strip!
    end
    if hasValue(seasonID)
      seasonID.strip!
    end

    team = Team.first(:teamID => teamID.upcase)
    if team
      season = team.seasons.first(:seasonID => seasonID)
    end

    return season
  end

  # ---------
  # - Teams -
  # ---------

  def allTeams
    return Team.all :order => :name
  end

  def allTeamsInConference(conference)

    if hasValue(conference)
      conference.strip!
    end

    return Team.all(Team.division.conference.name => conference.capitalize, :order => :name)
  end

  def allTeamsInDivision(division)

    if hasValue(division)
      division.strip!
    end

    return Team.all(Team.division.name => division.capitalize, :order => :name)
  end

  def specificTeam(teamID)

    if hasValue(teamID)
      teamID.strip!
    end

    return Team.first(:teamID => teamID.upcase)
  end

  # ---------
  # - Games -
  # ---------

  def allGamesForSeason(seasonID, gameType, order)

    if hasValue(seasonID)
      seasonID.strip!
    end
    if hasValue(gameType)
      gameType.strip!
    end
    if hasValue(order)
      order.strip!
    end

    season = Season.first(:seasonID => seasonID)

    if season

      # Check if the order parameter was passed in
      if !hasValue(order)
        games = season.games :order => :gameID.desc
      else
        if order.upcase == "DESC"
          games = season.games :order => :gameID.desc
        else
          games = season.games :order => :gameID
        end
      end

      # Filter games by type (regular season or playoffs)
      if games
        if hasValue(gameType)
          games = games.all(:gameType => gameType.capitalize)
        end
      end

    end

    return games
  end

  def allGamesForSeasonAndTeam(seasonID, teamID, gameType, order)

    if hasValue(seasonID)
      seasonID.strip!
    end
    if hasValue(teamID)
      teamID.strip!
    end
    if hasValue(gameType)
      gameType.strip!
    end
    if hasValue(order)
      order.strip!
    end

    season = Season.first(:seasonID => seasonID)

    if season

      # Check if the order parameter was passed in
      if !hasValue(order)
        allGames = season.games :order => :gameID.desc
      else
        if order.upcase == "DESC"
          allGames = season.games :order => :gameID.desc
        else
          allGames = season.games :order => :gameID
        end
      end

      # Merge games where the passed in team was home and away
      gamesAway = allGames.all(Game.awayTeam.teamID => teamID.upcase)
      gamesHome = allGames.all(Game.homeTeam.teamID => teamID.upcase)
      games = gamesAway | gamesHome

      # Filter games by type (regular season or playoffs)
      if games
        if hasValue(gameType)
          games = games.all(:gameType => gameType.capitalize)
        end
      end
    end

    return games
  end

  def allGameForSeasonAndHomeAwayTeam(seasonID, homeTeamID, awayTeamID, gameType, order)

    if hasValue(seasonID)
      seasonID.strip!
    end
    if hasValue(homeTeamID)
      homeTeamID.strip!
    end
    if hasValue(awayTeamID)
      awayTeamID.strip!
    end
    if hasValue(gameType)
      gameType.strip!
    end
    if hasValue(order)
      order.strip!
    end

    season = Season.first(:seasonID => seasonID)

    if season

      # Check if the order parameter was passed in
      if !hasValue(order)
        allGames = season.games :order => :gameID.desc
      else
        if order.upcase == "DESC"
          allGames = season.games :order => :gameID.desc
        else
          allGames = season.games :order => :gameID
        end
      end

      # Check if home team and/or away team was specified
      if hasValue(awayTeamID) && !hasValue(homeTeamID)
        games = allGames.all(Game.awayTeam.teamID => awayTeamID.upcase)
      elsif hasValue(homeTeamID) && !hasValue(awayTeamID)
        games = allGames.all(Game.homeTeam.teamID => homeTeamID.upcase)
      elsif hasValue(awayTeamID) && hasValue(homeTeamID)
        gamesAway = allGames.all(Game.awayTeam.teamID => awayTeamID.upcase)
        gamesHome = allGames.all(Game.homeTeam.teamID => homeTeamID.upcase)
        games = gamesAway & gamesHome
      end

      # Filter games by type (regular season or playoffs)
      if games
        if hasValue(gameType)
          games = games.all(:gameType => gameType.capitalize)
        end
      end
    end

    return games
  end

  def specificGameInSeason(seasonID, gameID)

    if hasValue(seasonID)
      seasonID.strip!
    end
    if hasValue(gameID)
      gameID.strip!
    end


    season = Season.first(:seasonID => seasonID)
    if season
      game =  season.games.first(:gameID => gameID)
    end

    return game
  end

  # ---------
  # - Links -
  # ---------

  def seasonLinks(teamID, seasonID, gameType)

    if hasValue(teamID)
      teamID.strip!
    end
    if hasValue(seasonID)
      seasonID.strip!
    end
    if hasValue(gameType)
      gameType.strip!
    end

    links = Array.new

    team = specificTeam(teamID)
    season = specificSeasonForTeam(teamID, seasonID)

    # Make sure passed in team and season are valid
    if team && season
      year = season.seasonID
      teamAbbrev = team.teamID
      teamName = team.name
      teamNumber = team.dmID
      gameTypeNumber = "2"

      # Check if gameType is playoffs
      if gameType && gameType.capitalize == 'Playoffs'
        # Check if team was in the playoffs for this season
        if wasTeamInPlayoffs(teamAbbrev, year)
          gameTypeNumber = "3"
        else
          # Requested playoff links for team that was not in playoffs
          return links
        end
      end

      # Check if team number is for WPG
      if teamNumber > 30
        # Hardcode to 2 for ATL
        teamNumber = 2
      end

      newLink = Link.new("NHL.com", "Schedule", "http://www.nhl.com/ice/schedulebyseason.htm?season=#{year}&gameType=#{gameTypeNumber}&team=#{teamAbbrev}&network=&venue=")
      links << newLink
      newLink = Link.new("NHL.com", "Summary", "http://www.nhl.com/ice/playerstats.htm?season=#{year}&gameType=#{gameTypeNumber}&team=#{teamAbbrev}&position=S&country=&status=&viewName=summary")
      links << newLink
      newLink = Link.new("NHL.com", "Goals", "http://www.nhl.com/ice/playerstats.htm?gameType=#{gameTypeNumber}&position=S&season=#{year}&sort=goals&status=A&team=#{teamAbbrev}&viewName=goals")
      links << newLink
      newLink = Link.new("NHL.com", "Assists", "http://www.nhl.com/ice/playerstats.htm?gameType=#{gameTypeNumber}&position=S&season=#{year}&sort=assists&status=A&team=#{teamAbbrev}&viewName=assists")
      links << newLink
      newLink = Link.new("NHL.com", "Penalties", "http://www.nhl.com/ice/playerstats.htm?gameType=#{gameTypeNumber}&position=S&season=#{year}&sort=penaltyMinutes&status=A&team=#{teamAbbrev}&viewName=penalties")
      links << newLink
      newLink = Link.new("NHL.com", "Special Teams", "http://www.nhl.com/ice/playerstats.htm?gameType=#{gameTypeNumber}&position=S&season=#{year}&sort=powerPlayGoals&status=A&team=#{teamAbbrev}&viewName=scoringLeaders")
      links << newLink
      newLink = Link.new("NHL.com", "Faceoffs", "http://www.nhl.com/ice/playerstats.htm?gameType=#{gameTypeNumber}&position=S&season=#{year}&sort=totalFaceOffs&status=A&team=#{teamAbbrev}&viewName=faceOffPercentageAll")
      links << newLink
      newLink = Link.new("NHL.com", "Time on Ice", "http://www.nhl.com/ice/playerstats.htm?gameType=#{gameTypeNumber}&position=S&season=#{year}&sort=timeOnIce&status=A&team=#{teamAbbrev}&viewName=timeOnIce")
      links << newLink
      newLink = Link.new("Hockey-Reference", "Roster and Statistics", "http://www.hockey-reference.com/teams/#{teamAbbrev}/#{year[4,4]}.html")
      links << newLink
      newLink = Link.new("Hockey-Reference", "Schedule and Results", "http://www.hockey-reference.com/teams/#{teamAbbrev}/#{year[4,4]}_games.html")
      links << newLink
      newLink = Link.new("Behind the Net", "Player Breakdown", "http://www.behindthenet.ca/nhl_statistics.php?ds=29&f1=#{year[0,4]}_#{gameTypeNumber == "3" ? "p" : "s"}&f2=5v5&f5=#{fixBTNTeamName(teamAbbrev)}&c=0+3+4+6+7+8+29+30+31+13+14+15+16+11+12+34+32+33+35+36+17+18+19+20+21+22+25+26+27+28+10+37+38+39+40+47+48+49+50+51+52+53+54+55+56+63+67+57+58+59+60+61+62+64+65+66+41+42+43+44+45+46")
      links << newLink
      newLink = Link.new("Behind the Net", "Player Shooting", "http://www.behindthenet.ca/nhl_shot_statistics.php?ds=13&f1=#{year[0,4]}_#{gameTypeNumber == "3" ? "p" : "s"}&f2=5v5&f5=#{fixBTNTeamName(teamAbbrev)}&c=0+1+3+5+4+7+8+9+10+11+12+13+14+15+16+17+18+19+20+21+22+23+24+25+26+27+28")
      links << newLink
      newLink = Link.new("Behind the Net", "Linemates", "http://www.behindthenet.ca/nhl_time_on_ice_stats.php?ds=8&f1=#{year[0,4]}_#{gameTypeNumber == "3" ? "p" : "s"}&f2=5v5&f5=#{fixBTNTeamName(teamAbbrev)}&c=0+1+3+5+8+9+10+11+12+13+14+15+16+17+18+19+20+21+22+23+24+25+26+27+28")
      links << newLink
      newLink = Link.new("Hockey Analysis", "Player Ratings (Goals)", "http://stats.hockeyanalysis.com/ratings.php?db=#{year[0, 4] + year[6, 2]}&sit=5v5&type=goals&teamid=#{teamNumber}&pos=skaters&minutes=50&disp=1")
      links << newLink
      newLink = Link.new("Hockey Analysis", "Player Ratings (Fenwick)", "http://stats.hockeyanalysis.com/ratings.php?db=#{year[0, 4] + year[6, 2]}&sit=5v5&type=fenwick&teamid=#{teamNumber}&pos=skaters&minutes=50&disp=1")
      links << newLink
      newLink = Link.new("Hockey Analysis", "Individual Stats", "http://stats.hockeyanalysis.com/ratings.php?db=#{year[0, 4] + year[6, 2]}&sit=5v5&type=individual&teamid=#{teamNumber}&pos=skaters&minutes=50&disp=1")
      links << newLink
      newLink = Link.new("Some Kind of Ninja", "Player Usage Chart", "http://somekindofninja.com/nhl/usage.php?f1=#{year[0,4]}_#{gameTypeNumber == "3" ? "p" : "s"}&f2=5v5&f3=&f5=#{fixBTNTeamName(teamAbbrev)}&f4=&f7=&update-filters=Update+Results")
      links << newLink
      newLink = Link.new("Some Kind of Ninja", "Super Shot Search", "http://somekindofninja.com/nhl/index.php?season=#{gameTypeNumber == "3" ? "Post" : "Regular"}&year=#{year[0,4]}-#{year[4,4]}&shots=For&team=#{teamName.gsub(' ', '+')}&ice_player_name=&withPlayer=On+Ice&player_name=&goalie_name=&event=Shots+and+Goals&game=Away&strength=Even&time=Regulation&search=Search")
      links << newLink
    end

    return links
  end

  def gameLinks(seasonID, gameID)

    if hasValue(seasonID)
      seasonID.strip!
    end
    if hasValue(gameID)
      gameID.strip!
    end

    links = Array.new

    season = specificSeason(seasonID)
    game = specificGameInSeason(seasonID, gameID)

    # Make sure season and game are valid
    if season && game
      year = season.seasonID
      gameNumber = game.gameID

      # Format away team name for Extra Skater site
      awayTeam = game.awayTeam.name
      awayTeamParts = awayTeam.split
      awayTeamAbbrev = awayTeamParts[-1].downcase

      # Maple Leafs and Blue Jackets are the only teams with two words in their name
      if awayTeamAbbrev == "leafs"
        awayTeamAbbrev = "maple-" + awayTeamAbbrev
      end
      if awayTeamAbbrev == "jackets"
        awayTeamAbbrev = "blue-" + awayTeamAbbrev
      end

      # Format home team name for Extra Skater site
      homeTeam = game.homeTeam.name
      homeTeamParts = homeTeam.split
      homeTeamAbbrev = homeTeamParts[-1].downcase

      # Maple Leafs and Blue Jackets are the only teams with two words in their name
      if homeTeamAbbrev == "leafs"
        homeTeamAbbrev = "maple-" + homeTeamAbbrev
      end
      if homeTeamAbbrev == "jackets"
        homeTeamAbbrev = "blue-" + homeTeamAbbrev
      end

      # Format game date for Extra Skater site
      gameDate = game.date
      gameDateString = Date.parse(gameDate).to_s

      newLink = Link.new("NHL.com", "Boxscore", "http://www.nhl.com/ice/boxscore.htm?id=#{gameNumber}")
      links << newLink
      newLink = Link.new("NHL.com", "Recap", "http://www.nhl.com/ice/recap.htm?id=#{gameNumber}")
      links << newLink
      newLink = Link.new("NHL.com", "Ice Tracker", "http://www.nhl.com/ice/icetracker.htm?id=#{gameNumber}")
      links << newLink
      newLink = Link.new("NHL.com", "Game Summary", "http://www.nhl.com/scores/htmlreports/#{year}/GS#{gameNumber[-6, 6]}.HTM")
      links << newLink
      newLink = Link.new("NHL.com", "Event Summary", "http://www.nhl.com/scores/htmlreports/#{year}/ES#{gameNumber[-6, 6]}.HTM")
      links << newLink
      newLink = Link.new("NHL.com", "Faceoff Summary", "http://www.nhl.com/scores/htmlreports/#{year}/FC#{gameNumber[-6, 6]}.HTM")
      links << newLink
      newLink = Link.new("NHL.com", "Play-by-Play", "http://www.nhl.com/scores/htmlreports/#{year}/PL#{gameNumber[-6, 6]}.HTM")
      links << newLink
      newLink = Link.new("NHL.com", "Home Time on Ice", "http://www.nhl.com/scores/htmlreports/#{year}/TH#{gameNumber[-6, 6]}.HTM")
      links << newLink
      newLink = Link.new("NHL.com", "Away Time on Ice", "http://www.nhl.com/scores/htmlreports/#{year}/TV#{gameNumber[-6, 6]}.HTM")
      links << newLink
      newLink = Link.new("NHL.com", "Playing Roster", "http://www.nhl.com/scores/htmlreports/#{year}/RO#{gameNumber[-6, 6]}.HTM")
      links << newLink
      newLink = Link.new("NHL.com", "Shot Report", "http://www.nhl.com/scores/htmlreports/#{year}/SS#{gameNumber[-6, 6]}.HTM")
      links << newLink
      newLink = Link.new("Extra Skater", "Advanced Stats", "http://www.extraskater.com/game/#{gameDateString}-#{awayTeamAbbrev}-#{homeTeamAbbrev}")
      links << newLink
      newLink = Link.new("Nullisecund", "Even Strength Shooting", "http://nullisecund.us/nhl/game.php?id=#{gameNumber[-5, 5]}")
      links << newLink
      newLink = Link.new("Nullisecund", "Shift Chart", "http://nullisecund.us/nhl/toi.php?id=#{gameNumber[-5, 5]}")
      links << newLink
      newLink = Link.new("Time on Ice", "Shift Chart", "http://timeonice.com/#{year == CURRENTSEASON ? "default" : "SC" + year[2, 2] + year[-2, 2]}.html?GameNumber=#{gameNumber[-5, 5]}&submit=Go")
      links << newLink
      newLink = Link.new("Time on Ice", "Head-to-Head", "http://timeonice.com/H2H#{year[2, 2] + year[-2, 2]}.html?GameNumber=#{gameNumber[-5, 5]}&submit=Go")
      links << newLink
      newLink = Link.new("Time on Ice", "Fenwick/Corsi", "http://timeonice.com/shots#{year[2, 2] + year[-2, 2]}.php?gamenumber=#{gameNumber[-5, 5]}")
      links << newLink
      newLink = Link.new("Time on Ice", "Zone Starts", "http://www.timeonice.com/faceoffs#{year[2, 2] + year[-2, 2]}.php?gamenumber=#{gameNumber[-5, 5]}")
      links << newLink
      newLink = Link.new("Behind the Net", "Shot Timeline", "http://behindthenet.ca/charts/Shots_#{game.gameType == "Playoffs" ? "Playoffs_" : ""}#{year[0,4]}_#{gameNumber[-5, 5]}.php")
      links << newLink


    end

    return links
  end

  # -------
  # - API -
  # -------

  def getAPIResources
    apiResources = Array.new

    # Build array of APIResource objects
    # Each APIResource object has a path, query string parameters, a description, an array of inputs, and an array of input descriptions

    inputs = Array.new
    inputDescs = Array.new
    newAPIResource = APIResource.new("/api/seasons", "", " Returns all available seasons as a JSON array", inputs, inputDescs)
    apiResources << newAPIResource

    inputs = Array.new
    inputDescs = Array.new
    inputs << "seasonID"
    inputDescs << "A season number. Ex: #{CURRENTSEASON}"
    newAPIResource = APIResource.new("/api/seasons/{seasonID}", "", "Returns the specified season as a JSON object", inputs, inputDescs)
    apiResources << newAPIResource

    inputs = Array.new
    inputDescs = Array.new
    inputs << "seasonID"
    inputs << "gameType"
    inputs << "order"
    inputs << "team"
    inputs << "awayTeam"
    inputs << "homeTeam"
    inputDescs << "A season number. Ex: #{CURRENTSEASON}"
    inputDescs << "A game type. Either Regular or Playoffs"
    inputDescs << "A game date sort order. Either ASC or DESC"
    inputDescs << "A team abbreviation. Ex: WSH"
    inputDescs << "A team abbreviation. Overriden by teamID. Ex: WSH"
    inputDescs << "A team abbreviation. Overriden by teamID. Ex: WSH"
    newAPIResource = APIResource.new("/api/seasons/{seasonID}/games", "gameType={gameType}&order={order}&team={team}&awayTeam={awayTeam}&homeTeam={homeTeam}", "Returns all games in a season as a JSON array", inputs, inputDescs)
    apiResources << newAPIResource

    inputs = Array.new
    inputDescs = Array.new
    inputs << "seasonID"
    inputs << "gameID"
    inputDescs << "A season number. Ex: #{CURRENTSEASON}"
    inputDescs << "A game number. Ex: 2011021218"
    newAPIResource = APIResource.new("/api/seasons/{seasonID}/games/{gameID}", "", "Returns a specified game for the specified season as a JSON object", inputs, inputDescs)
    apiResources << newAPIResource

    inputs = Array.new
    inputDescs = Array.new
    inputs << "seasonID"
    inputs << "gameID"
    inputDescs << "A season number. Ex: #{CURRENTSEASON}"
    inputDescs << "A game number. Ex: 2011021218"
    newAPIResource = APIResource.new("/api/seasons/{seasonID}/games/{gameID}/links", "", "Returns links for the specified game as a JSON array", inputs, inputDescs)
    apiResources << newAPIResource

    inputs = Array.new
    inputs << "conference"
    inputs << "division"
    inputDescs = Array.new
    inputDescs << "A conference name. Ex: Eastern"
    inputDescs << "A division name. Ex: Southeast"
    newAPIResource = APIResource.new("/api/teams", "conference={conference}&division={division}", "Returns all available available teams as a JSON array", inputs, inputDescs)
    apiResources << newAPIResource

    inputs = Array.new
    inputDescs = Array.new
    inputs << "teamID"
    inputDescs << "A team abbreviation. Ex: WSH"
    newAPIResource = APIResource.new("/api/teams/{teamID}", "", "Returns the specified team as a JSON object", inputs, inputDescs)
    apiResources << newAPIResource

    inputs = Array.new
    inputDescs = Array.new
    inputs << "teamID"
    inputDescs << "A team abbreviation. Ex: WSH"
    newAPIResource = APIResource.new("/api/teams/{teamID}/seasons", "", "Returns all seasons for a specified team as a JSON array", inputs, inputDescs)
    apiResources << newAPIResource

    inputs = Array.new
    inputDescs = Array.new
    inputs << "teamID"
    inputs << "seasonID"
    inputDescs << "A team abbreviation. Ex: WSH"
    inputDescs << "A season number. Ex: #{CURRENTSEASON}"
    newAPIResource = APIResource.new("/api/teams/{teamID}/seasons/{seasonID}", "", "Returns the specified season for a team as a JSON array", inputs, inputDescs)
    apiResources << newAPIResource

    inputs = Array.new
    inputDescs = Array.new
    inputs << "teamID"
    inputs << "seasonID"
    inputs << "gameType"
    inputDescs << "A team abbreviation. Ex: WSH"
    inputDescs << "A season number. Ex: #{CURRENTSEASON}"
    inputDescs << "A game type. Either Regular or Playoffs"
    newAPIResource = APIResource.new("/api/teams/{teamID}/seasons/{seasonID}/links", "gameType={gameType}", "Returns links for the specified season as a JSON array", inputs, inputDescs)
    apiResources << newAPIResource

    return apiResources
  end

  # ------------------
  # - Helper Methods -
  # ------------------

  def hasValue(val)
    !val.nil? && !val.strip.empty?
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

  def wasTeamInPlayoffs(teamID, seasonID)
    # Get home playoff games for team and season (team in playoffs will have have least two home games)
    games = Season.first(:seasonID => seasonID).games.all(Game.homeTeam.teamID => teamID, :gameType => 'Playoffs')
    games.count > 0
  end

end