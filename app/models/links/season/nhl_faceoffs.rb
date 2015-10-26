class Links::Season::NhlFaceoffs < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Faceoffs"
  end

  def url
    "http://www.nhl.com/stats/player?" \
    "team=#{team.abbreviation}&season=#{season}&" \
    "gameType=#{game_type}&report=faceoffs"
  end

  def group
    0
  end

  def position
    9
  end
end
