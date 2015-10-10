class Links::Season::NhlBios < Links::Base

  def site_name
    "NHL.com"
  end

  def description
    "Bios"
  end

  def url
   "http://www.nhl.com/stats/player?" \
   "team=#{team.abbreviation}&season=#{season}&" \
   "gameType=#{game_type}&report=bios"
  end

  def group
    0
  end

  def position
    17
  end

end
