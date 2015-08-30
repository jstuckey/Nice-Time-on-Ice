class Links::BtnPlayerShooting < Links::Base

  def site_name
    "Behind the Net"
  end

  def description
    "Player Shooting"
  end

  def url
    "http://www.behindthenet.ca/nhl_shot_statistics.php?" \
    "ds=13&f1=#{season.year_start}_#{alternate_game_type}" \
    "&f2=5v5&f5=#{alternate_team_abbreviation}" \
    "&c=0+1+3+5+4+7+8+9+10+11+12+13+14+15+16+17+18+19+" \
    "20+21+22+23+24+25+26+27+28"
  end

  def group
    0
  end

  def position
    1
  end

end
