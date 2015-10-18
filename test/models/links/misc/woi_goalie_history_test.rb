require 'test_helper'

class Links::Misc::WoiGoalieHistoryTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "War-on-Ice", Links::Misc::WoiGoalieHistory.new.site_name
  end

  test "#description" do
    assert_equal "Goaltender History", Links::Misc::WoiGoalieHistory.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://war-on-ice.com/goalieseason.html"

    link = Links::Misc::WoiGoalieHistory.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 1, Links::Misc::WoiGoalieHistory.new.group
  end

  test "#position" do
    assert_equal 3, Links::Misc::WoiGoalieHistory.new.position
  end

end
