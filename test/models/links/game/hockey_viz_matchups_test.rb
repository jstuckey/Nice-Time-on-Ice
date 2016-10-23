require 'test_helper'

class Links::Game::HockeyVizMatchupsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey Viz", Links::Game::HockeyVizMatchups.new.site_name
  end

  test "#description" do
    assert_equal "5v5 Matchups", Links::Game::HockeyVizMatchups.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://hockeyviz.com/game/2014021201/matchups"

    link = Links::Game::HockeyVizMatchups.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 4, Links::Game::HockeyVizMatchups.new.group
  end

  test "#position" do
    assert_equal 4, Links::Game::HockeyVizMatchups.new.position
  end

end
