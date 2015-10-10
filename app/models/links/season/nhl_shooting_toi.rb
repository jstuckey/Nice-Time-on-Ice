class Links::Season::NhlShootingToi < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Shooting/TOI"
  end

  def url
   "http://www.nhl.com/stats/player?" \
   "team=#{team.abbreviation}&season=#{season}&" \
   "gameType=#{game_type}&report=skatershootingtimeonice"
  end

  def group
    0
  end

  def position
    15
  end

end
