class Links::Season::NhlGoals < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Goals"
  end

  def url
    "http://www.nhl.com/ice/playerstats.htm?gameType=" \
    "#{game_type}&position=S&season=#{season}&sort=goals" \
    "&status=A&team=#{team.abbreviation}&viewName=goals"
  end

  def group
    0
  end

  def position
    2
  end
end
