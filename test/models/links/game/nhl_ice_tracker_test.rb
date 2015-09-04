require 'test_helper'

class Links::Game::NhlIceTrackerTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::Game::NhlIceTracker.new.site_name
  end

  test "#description" do
    assert_equal "Ice Tracker", Links::Game::NhlIceTracker.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://www.nhl.com/ice/icetracker.htm?id=2014021217"

    link = Links::Game::NhlIceTracker.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Game::NhlIceTracker.new.group
  end

  test "#position" do
    assert_equal 2, Links::Game::NhlIceTracker.new.position
  end

end
