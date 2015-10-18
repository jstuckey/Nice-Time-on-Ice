require 'test_helper'

class Links::Misc::WoiGoalieHextallyTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "War-on-Ice", Links::Misc::WoiGoalieHextally.new.site_name
  end

  test "#description" do
    assert_equal "Goaltender Hextally", Links::Misc::WoiGoalieHextally.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://war-on-ice.com/hexgoalies.html"

    link = Links::Misc::WoiGoalieHextally.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 1, Links::Misc::WoiGoalieHextally.new.group
  end

  test "#position" do
    assert_equal 4, Links::Misc::WoiGoalieHextally.new.position
  end

end
