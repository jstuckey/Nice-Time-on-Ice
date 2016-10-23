require 'test_helper'

class Links::Game::HockeyVizShotTideTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey Viz", Links::Game::HockeyVizShotTide.new.site_name
  end

  test "#description" do
    assert_equal "Shot Tide", Links::Game::HockeyVizShotTide.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://hockeyviz.com/game/2014021201/tide"

    link = Links::Game::HockeyVizShotTide.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 4, Links::Game::HockeyVizShotTide.new.group
  end

  test "#position" do
    assert_equal 2, Links::Game::HockeyVizShotTide.new.position
  end

end
