require 'test_helper'

class Links::Misc::ScPlayerStatsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Sporting Charts", Links::Misc::ScPlayerStats.new.site_name
  end

  test "#description" do
    assert_equal "Player Stats", Links::Misc::ScPlayerStats.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.sportingcharts.com/stats/nhl/player/"

    link = Links::Misc::ScPlayerStats.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 5, Links::Misc::ScPlayerStats.new.group
  end

  test "#position" do
    assert_equal 2, Links::Misc::ScPlayerStats.new.position
  end

end
