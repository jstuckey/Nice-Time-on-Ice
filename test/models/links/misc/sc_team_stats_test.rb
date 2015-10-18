require 'test_helper'

class Links::Misc::ScTeamStatsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Sporting Charts", Links::Misc::ScTeamStats.new.site_name
  end

  test "#description" do
    assert_equal "Team Stats", Links::Misc::ScTeamStats.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.sportingcharts.com/stats/nhl/team/"

    link = Links::Misc::ScTeamStats.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 5, Links::Misc::ScTeamStats.new.group
  end

  test "#position" do
    assert_equal 1, Links::Misc::ScTeamStats.new.position
  end

end
