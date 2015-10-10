require 'test_helper'

class Links::Game::NhlEventSummaryTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::Game::NhlEventSummary.new.site_name
  end

  test "#description" do
    assert_equal "Event Summary", Links::Game::NhlEventSummary.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://www.nhl.com/scores/htmlreports/20142015/ES021201.HTM"

    link = Links::Game::NhlEventSummary.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Game::NhlEventSummary.new.group
  end

  test "#position" do
    assert_equal 4, Links::Game::NhlEventSummary.new.position
  end

end
