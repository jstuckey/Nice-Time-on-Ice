class BehindTheNetLinkPresenter < LinkPresenterBase
  include LinkHelpers

  def names
    [
      "Player Breakdown",
      "Player Shooting",
      "Linemates"
    ]
  end

  def links
    [
      player_breakdown_link,
      player_shooting_link,
      linemates_link
    ]
  end

  def player_breakdown_link
    "http://www.behindthenet.ca/nhl_statistics.php?" \
      "ds=29&f1=#{season.year_start}_#{alternate_game_type}" \
      "&f2=5v5&f5=#{alternate_team_abbreviation}" \
      "&c=0+3+4+6+7+8+29+30+31+13+14+15+16+11+12+34+32" \
      "+33+35+36+17+18+19+20+21+22+25+26+27+28+10+37+" \
      "38+39+40+47+48+49+50+51+52+53+54+55+56+63+67+57" \
      "+58+59+60+61+62+64+65+66+41+42+43+44+45+46"
  end

  def player_shooting_link
    "http://www.behindthenet.ca/nhl_shot_statistics.php?" \
      "ds=13&f1=#{season.year_start}_#{alternate_game_type}" \
      "&f2=5v5&f5=#{alternate_team_abbreviation}" \
      "&c=0+1+3+5+4+7+8+9+10+11+12+13+14+15+16+17+18+19+" \
      "20+21+22+23+24+25+26+27+28"
  end

  def linemates_link
    "http://www.behindthenet.ca/nhl_time_on_ice_stats.php?" \
      "ds=8&f1=#{season.year_start}_#{alternate_game_type}" \
      "&f2=5v5&f5=#{alternate_team_abbreviation}&c=0+1+3+5+8+9+10" \
      "+11+12+13+14+15+16+17+18+19+20+21+22+23+24+25+26+27+28"
  end
end
