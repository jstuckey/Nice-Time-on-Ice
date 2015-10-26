class Links::Season::NhlAssists < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Assists"
  end

  def url
    "http://www.nhl.com/stats/player?" \
    "team=#{team.abbreviation}&season=#{season}&" \
    "gameType=#{game_type}&report=assists"
  end

  def group
    0
  end

  def position
    3
  end
end
