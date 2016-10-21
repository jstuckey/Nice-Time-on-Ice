require 'test_helper'

class Links::Game::NhlShiftChartTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::Game::NhlShiftChart.new.site_name
  end

  test "#description" do
    assert_equal "Shift Chart", Links::Game::NhlShiftChart.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://www.nhl.com/stats/shiftcharts?id=2014021201"

    link = Links::Game::NhlShiftChart.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Game::NhlShiftChart.new.group
  end

  test "#position" do
    assert_equal 12, Links::Game::NhlShiftChart.new.position
  end

end
