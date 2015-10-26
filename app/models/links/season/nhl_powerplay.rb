class Links::Season::NhlPowerplay < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Powerplay"
  end

  def url
    "http://www.nhl.com/stats/player?" \
    "team=#{team.abbreviation}&season=#{season}&" \
    "gameType=#{game_type}&report=powerplay"
  end

  def group
    0
  end

  def position
    6
  end

end
