require 'test_helper'

class Links::Season::NhlShootoutTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::Season::NhlShootout.new.site_name
  end

  test "#description" do
    assert_equal "Shootout", Links::Season::NhlShootout.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=shootout"

    link = Links::Season::NhlShootout.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Season::NhlShootout.new.group
  end

  test "#position" do
    assert_equal 8, Links::Season::NhlShootout.new.position
  end

end
