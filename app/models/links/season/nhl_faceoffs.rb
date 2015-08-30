class Links::Season::NhlFaceoffs < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Faceoffs"
  end

  def url
    "http://www.nhl.com/ice/playerstats.htm?gameType=" \
    "#{game_type}&position=S&season=#{season}&sort=" \
    "totalFaceOffs&status=A&team=#{team.abbreviation}&viewName=" \
    "faceOffPercentageAll"
  end

  def group
    0
  end

  def position
    6
  end
end
