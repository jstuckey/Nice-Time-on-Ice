require 'test_helper'

class Links::Game::NhlHomeToiTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::Game::NhlHomeToi.new.site_name
  end

  test "#description" do
    assert_equal "Home Time on Ice", Links::Game::NhlHomeToi.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://www.nhl.com/scores/htmlreports/20142015/TH021217.HTM"

    link = Links::Game::NhlHomeToi.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Game::NhlHomeToi.new.group
  end

  test "#position" do
    assert_equal 7, Links::Game::NhlHomeToi.new.position
  end

end
