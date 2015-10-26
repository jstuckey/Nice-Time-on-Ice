class Links::Season::NhlScoring < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Scoring"
  end

  def url
    "http://www.nhl.com/stats/player?" \
    "team=#{team.abbreviation}&season=#{season}&" \
    "gameType=#{game_type}&report=skaterscoring"
  end

  def group
    0
  end

  def position
    16
  end

end
