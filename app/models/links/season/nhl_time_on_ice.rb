class Links::Season::NhlTimeOnIce < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Time on Ice"
  end

  def url
    "http://www.nhl.com/stats/player?" \
    "team=#{team.abbreviation}&season=#{season}&" \
    "gameType=#{game_type}&report=timeonice"
  end

  def group
    0
  end

  def position
    11
  end
end
