require 'test_helper'

class Links::Game::HvGameShotsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey Viz", Links::Game::HvGameShots.new.site_name
  end

  test "#description" do
    assert_equal "Game Shots", Links::Game::HvGameShots.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"
    game = games(:game_one)

    url = "http://hockeyviz.com/img/game/shots/1415/gameShots-2015-04-08-2014021201-BOSatWSH.png"

    link = Links::Game::HvGameShots.new(team: team, season: season, game_type: game_type, game: game)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 5, Links::Game::HvGameShots.new.group
  end

  test "#position" do
    assert_equal 0, Links::Game::HvGameShots.new.position
  end

end
