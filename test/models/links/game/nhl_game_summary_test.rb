require 'test_helper'

class Links::Game::NhlGameSummaryTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::Game::NhlGameSummary.new.site_name
  end

  test "#description" do
    assert_equal "Game Summary", Links::Game::NhlGameSummary.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://www.nhl.com/scores/htmlreports/20142015/GS021201.HTM"

    link = Links::Game::NhlGameSummary.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Game::NhlGameSummary.new.group
  end

  test "#position" do
    assert_equal 3, Links::Game::NhlGameSummary.new.position
  end

end
