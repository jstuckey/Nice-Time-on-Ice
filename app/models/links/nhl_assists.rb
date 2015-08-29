class Links::NhlAssists < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Assists"
  end

  def url
    "http://www.nhl.com/ice/playerstats.htm?gameType=" \
    "#{game_type}&position=S&season=#{season}&sort=assists" \
    "&status=A&team=#{team.abbreviation}&viewName=assists"
  end

  def group
    0
  end

  def position
    3
  end
end
