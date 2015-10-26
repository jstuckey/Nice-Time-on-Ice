class Links::Season::NhlShooting < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Shooting"
  end

  def url
    "http://www.nhl.com/stats/player?" \
    "team=#{team.abbreviation}&season=#{season}&" \
    "gameType=#{game_type}&report=skatersummaryshooting"
  end

  def group
    0
  end

  def position
    13
  end

end
