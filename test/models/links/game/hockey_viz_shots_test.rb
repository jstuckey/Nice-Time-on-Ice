require 'test_helper'

class Links::Game::HockeyVizShotsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey Viz", Links::Game::HockeyVizShots.new.site_name
  end

  test "#description" do
    assert_equal "5v5 Shots", Links::Game::HockeyVizShots.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://hockeyviz.com/game/2014021201/byPlayer"

    link = Links::Game::HockeyVizShots.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 4, Links::Game::HockeyVizShots.new.group
  end

  test "#position" do
    assert_equal 3, Links::Game::HockeyVizShots.new.position
  end

end
