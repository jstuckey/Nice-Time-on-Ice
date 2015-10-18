require 'test_helper'

class Links::Season::WoiTeamComparisonTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "War-on-Ice", Links::Season::WoiTeamComparison.new.site_name
  end

  test "#description" do
    assert_equal "Team Comparison", Links::Season::WoiTeamComparison.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://war-on-ice.com/teamtable.html?playoffs=Regular&start0=20142015&end0=20142015"

    link = Links::Season::WoiTeamComparison.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 5, Links::Season::WoiTeamComparison.new.group
  end

  test "#position" do
    assert_equal 3, Links::Season::WoiTeamComparison.new.position
  end

end
