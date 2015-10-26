class Links::Season::NhlPenalties < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Penalties"
  end

  def url
    "http://www.nhl.com/stats/player?" \
    "team=#{team.abbreviation}&season=#{season}&" \
    "gameType=#{game_type}&report=penalties"
  end

  def group
    0
  end

  def position
    10
  end
end
