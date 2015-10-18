require 'test_helper'

class Links::Misc::WoiTeamHistoryTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "War-on-Ice", Links::Misc::WoiTeamHistory.new.site_name
  end

  test "#description" do
    assert_equal "Team History", Links::Misc::WoiTeamHistory.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://war-on-ice.com/teambygame.html?team=WSH"

    link = Links::Misc::WoiTeamHistory.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 1, Links::Misc::WoiTeamHistory.new.group
  end

  test "#position" do
    assert_equal 5, Links::Misc::WoiTeamHistory.new.position
  end

end
