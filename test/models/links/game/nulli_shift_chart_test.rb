require 'test_helper'

class Links::Game::NulliShiftChartTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Nullisecund", Links::Game::NulliShiftChart.new.site_name
  end

  test "#description" do
    assert_equal "Shift Chart", Links::Game::NulliShiftChart.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://nullisecund.us/nhl/toi.php?id=21217"

    link = Links::Game::NulliShiftChart.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 1, Links::Game::NulliShiftChart.new.group
  end

  test "#position" do
    assert_equal 1, Links::Game::NulliShiftChart.new.position
  end

end
