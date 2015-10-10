require 'test_helper'

class Links::Game::NstGameStatsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Natural Stat Trick", Links::Game::NstGameStats.new.site_name
  end

  test "#description" do
    assert_equal "Game Statistics", Links::Game::NstGameStats.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://naturalstattrick.com/game.php?season=20142015&game=21201"

    link = Links::Game::NstGameStats.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 4, Links::Game::NstGameStats.new.group
  end

  test "#position" do
    assert_equal 0, Links::Game::NstGameStats.new.position
  end

end
