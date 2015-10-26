class Links::Season::NhlPoints < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Points"
  end

  def url
    "http://www.nhl.com/stats/player?" \
    "team=#{team.abbreviation}&season=#{season}&" \
    "gameType=#{game_type}&report=points"
  end

  def group
    0
  end

  def position
    4
  end

end
