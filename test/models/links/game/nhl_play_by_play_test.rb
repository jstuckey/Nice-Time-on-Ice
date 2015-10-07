require 'test_helper'

class Links::Game::NhlPlayByPlayTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::Game::NhlPlayByPlay.new.site_name
  end

  test "#description" do
    assert_equal "Play-by-Play", Links::Game::NhlPlayByPlay.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://www.nhl.com/scores/htmlreports/20142015/PL021217.HTM"

    link = Links::Game::NhlPlayByPlay.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Game::NhlPlayByPlay.new.group
  end

  test "#position" do
    assert_equal 6, Links::Game::NhlPlayByPlay.new.position
  end

end
