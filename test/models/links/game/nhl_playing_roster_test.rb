require 'test_helper'

class Links::Game::NhlPlayingRosterTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::Game::NhlPlayingRoster.new.site_name
  end

  test "#description" do
    assert_equal "Playing Roster", Links::Game::NhlPlayingRoster.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://www.nhl.com/scores/htmlreports/20142015/RO021217.HTM"

    link = Links::Game::NhlPlayingRoster.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Game::NhlPlayingRoster.new.group
  end

  test "#position" do
    assert_equal 9, Links::Game::NhlPlayingRoster.new.position
  end

end
