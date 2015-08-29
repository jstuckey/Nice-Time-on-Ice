class Links::NhlSummary < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Summary"
  end

  def url
   "http://www.nhl.com/ice/playerstats.htm?season=" \
   "#{season}&gameType=#{game_type}&team=#{team.abbreviation}" \
   "&position=S&country=&status=&viewName=summary"
  end

  def group
    0
  end

  def position
    1
  end
end
