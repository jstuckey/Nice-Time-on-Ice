require 'test_helper'

class Links::Game::NhlAwayToiTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::Game::NhlAwayToi.new.site_name
  end

  test "#description" do
    assert_equal "Away Time on Ice", Links::Game::NhlAwayToi.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://www.nhl.com/scores/htmlreports/20142015/TV021217.HTM"

    link = Links::Game::NhlAwayToi.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Game::NhlAwayToi.new.group
  end

  test "#position" do
    assert_equal 8, Links::Game::NhlAwayToi.new.position
  end

end
