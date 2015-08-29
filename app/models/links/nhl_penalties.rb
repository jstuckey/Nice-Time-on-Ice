class Links::NhlPenalties < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Penalties"
  end

  def url
    "http://www.nhl.com/ice/playerstats.htm?gameType=" \
    "#{game_type}&position=S&season=#{season}&sort=penaltyMinutes" \
    "&status=A&team=#{team.abbreviation}&viewName=penalties"
  end

  def group
    0
  end

  def position
    4
  end
end
