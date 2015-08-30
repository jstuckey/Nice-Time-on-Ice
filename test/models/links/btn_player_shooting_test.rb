require 'test_helper'

class Links::BtnPlayerShootingTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Behind the Net", Links::BtnPlayerShooting.new.site_name
  end

  test "#description" do
    assert_equal "Player Shooting", Links::BtnPlayerShooting.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.behindthenet.ca/nhl_shot_statistics.php?ds=13&f1=2014_s&f2=5v5&f5=WSH&c=0+1+3+5+4+7+8+9+10+11+12+13+14+15+16+17+18+19+20+21+22+23+24+25+26+27+28"

    link = Links::BtnPlayerShooting.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::BtnPlayerShooting.new.group
  end

  test "#position" do
    assert_equal 1, Links::BtnPlayerShooting.new.position
  end

end
