class Links::Season::NhlPlusMinus < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Plus/Minus"
  end

  def url
   "http://www.nhl.com/stats/player?" \
   "team=#{team.abbreviation}&season=#{season}&" \
   "gameType=#{game_type}&report=plusminus"
  end

  def group
    0
  end

  def position
    5
  end

end
