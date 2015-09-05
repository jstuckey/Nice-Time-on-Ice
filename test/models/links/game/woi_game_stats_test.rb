require 'test_helper'

class Links::Game::WoiGameStatsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "War-on-Ice", Links::Game::WoiGameStats.new.site_name
  end

  test "#description" do
    assert_equal "Game Statistics", Links::Game::WoiGameStats.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://war-on-ice.com/game.html?seasongcode=2014201521217"

    link = Links::Game::WoiGameStats.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 2, Links::Game::WoiGameStats.new.group
  end

  test "#position" do
    assert_equal 0, Links::Game::WoiGameStats.new.position
  end

end
