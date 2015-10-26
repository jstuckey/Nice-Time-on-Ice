class Links::Season::NhlSummary < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Summary"
  end

  def url
    "http://www.nhl.com/stats/player?" \
    "team=#{team.abbreviation}&season=#{season}&" \
    "gameType=#{game_type}&report=summary"
  end

  def group
    0
  end

  def position
    1
  end
end
