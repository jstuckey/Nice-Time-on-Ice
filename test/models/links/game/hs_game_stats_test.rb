require 'test_helper'

class Links::Game::HsGameStatsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey Stats", Links::Game::HsGameStats.new.site_name
  end

  test "#description" do
    assert_equal "Game Statistics", Links::Game::HsGameStats.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://hockeystats.ca/game/2014021201"

    link = Links::Game::HsGameStats.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 3, Links::Game::HsGameStats.new.group
  end

  test "#position" do
    assert_equal 0, Links::Game::HsGameStats.new.position
  end

end
