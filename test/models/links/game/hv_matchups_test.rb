require 'test_helper'

class Links::Game::HvMatchupsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey Viz", Links::Game::HvMatchups.new.site_name
  end

  test "#description" do
    assert_equal "Matchups", Links::Game::HvMatchups.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"
    game = games(:game_one)

    url = "http://hockeyviz.com/img/game/matchups/1415/matchups-2015-04-08-2014021201-BOSatWSH.png"

    link = Links::Game::HvMatchups.new(team: team, season: season, game_type: game_type, game: game)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 5, Links::Game::HvMatchups.new.group
  end

  test "#position" do
    assert_equal 1, Links::Game::HvMatchups.new.position
  end

end
