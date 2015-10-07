require 'test_helper'

class Links::Season::BtnLinematesTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Behind the Net", Links::Season::BtnLinemates.new.site_name
  end

  test "#description" do
    assert_equal "Linemates", Links::Season::BtnLinemates.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.behindthenet.ca/nhl_time_on_ice_stats.php?ds=8&f1=2014_s&f2=5v5&f5=WSH&c=0+1+3+5+8+9+10+11+12+13+14+15+16+17+18+19+20+21+22+23+24+25+26+27+28"

    link = Links::Season::BtnLinemates.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 2, Links::Season::BtnLinemates.new.group
  end

  test "#position" do
    assert_equal 2, Links::Season::BtnLinemates.new.position
  end

end
