class Links::Season::NhlShootout < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Shootout"
  end

  def url
    "http://www.nhl.com/stats/player?" \
    "team=#{team.abbreviation}&season=#{season}&" \
    "gameType=#{game_type}&report=shootout"
  end

  def group
    0
  end

  def position
    8
  end

end
