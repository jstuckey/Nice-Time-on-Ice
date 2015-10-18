require 'test_helper'

class Links::Season::WoiGoalieComparisonTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "War-on-Ice", Links::Season::WoiGoalieComparison.new.site_name
  end

  test "#description" do
    assert_equal "Goaltender Comparison", Links::Season::WoiGoalieComparison.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://war-on-ice.com/goalietable.html?playoffs=Regular&start1=2014-10-01&end1=2015-10-01"

    link = Links::Season::WoiGoalieComparison.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 5, Links::Season::WoiGoalieComparison.new.group
  end

  test "#position" do
    assert_equal 2, Links::Season::WoiGoalieComparison.new.position
  end

end
