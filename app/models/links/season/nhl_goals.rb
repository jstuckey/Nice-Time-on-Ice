class Links::Season::NhlGoals < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Goals"
  end

  def url
    "http://www.nhl.com/stats/player?" \
    "team=#{team.abbreviation}&season=#{season}&" \
    "gameType=#{game_type}&report=goals"
  end

  def group
    0
  end

  def position
    2
  end
end
