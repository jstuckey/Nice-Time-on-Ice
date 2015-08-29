class Links::NhlTimeOnIce < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Time on Ice"
  end

  def url
    "http://www.nhl.com/ice/playerstats.htm?gameType=" \
    "#{game_type}&position=S&season=#{season}&sort=" \
    "timeOnIce&status=A&team=#{team.abbreviation}&viewName=timeOnIce"
  end

  def group
    0
  end

  def position
    7
  end
end
