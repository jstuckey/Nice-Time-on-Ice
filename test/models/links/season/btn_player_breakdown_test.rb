require 'test_helper'

class Links::Season::BtnPlayerBreakdownTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Behind the Net", Links::Season::BtnPlayerBreakdown.new.site_name
  end

  test "#description" do
    assert_equal "Player Breakdown", Links::Season::BtnPlayerBreakdown.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.behindthenet.ca/nhl_statistics.php?ds=29&f1=2014_s&f2=5v5&f5=WSH&c=0+3+4+6+7+8+29+30+31+13+14+15+16+11+12+34+32+33+35+36+17+18+19+20+21+22+25+26+27+28+10+37+38+39+40+47+48+49+50+51+52+53+54+55+56+63+67+57+58+59+60+61+62+64+65+66+41+42+43+44+45+46"

    link = Links::Season::BtnPlayerBreakdown.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 2, Links::Season::BtnPlayerBreakdown.new.group
  end

  test "#position" do
    assert_equal 0, Links::Season::BtnPlayerBreakdown.new.position
  end

end
