class Links::Season::NhlSpecialTeams < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Special Teams"
  end

  def url
    "http://www.nhl.com/ice/playerstats.htm?gameType=" \
    "#{game_type}&position=S&season=#{season}&sort=" \
    "powerPlayGoals&status=A&team=#{team.abbreviation}&" \
    "viewName=scoringLeaders"
  end

  def group
    0
  end

  def position
    5
  end
end
