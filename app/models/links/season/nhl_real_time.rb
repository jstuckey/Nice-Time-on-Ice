class Links::Season::NhlRealTime < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Real Time"
  end

  def url
    "http://www.nhl.com/stats/player?" \
    "team=#{team.abbreviation}&season=#{season}&" \
    "gameType=#{game_type}&report=realtime"
  end

  def group
    0
  end

  def position
    12
  end

end
