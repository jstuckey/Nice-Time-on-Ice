require 'test_helper'

class Links::Season::NhlRealTimeTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::Season::NhlRealTime.new.site_name
  end

  test "#description" do
    assert_equal "Real Time", Links::Season::NhlRealTime.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=realtime"

    link = Links::Season::NhlRealTime.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Season::NhlRealTime.new.group
  end

  test "#position" do
    assert_equal 12, Links::Season::NhlRealTime.new.position
  end

end
