require 'test_helper'

class Links::Season::NhlTimeOnIceTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::Season::NhlTimeOnIce.new.site_name
  end

  test "#description" do
    assert_equal "Time on Ice", Links::Season::NhlTimeOnIce.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=timeonice"

    link = Links::Season::NhlTimeOnIce.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Season::NhlTimeOnIce.new.group
  end

  test "#position" do
    assert_equal 11, Links::Season::NhlTimeOnIce.new.position
  end

end
