class Links::Season::NhlPercentages < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Percentages"
  end

  def url
    "http://www.nhl.com/stats/player?" \
    "team=#{team.abbreviation}&season=#{season}&" \
    "gameType=#{game_type}&report=skaterpercentages"
  end

  def group
    0
  end

  def position
    14
  end

end
