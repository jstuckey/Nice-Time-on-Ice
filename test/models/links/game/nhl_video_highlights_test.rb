require 'test_helper'

class Links::Game::NhlVideoHighlightsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::Game::NhlVideoHighlights.new.site_name
  end

  test "#description" do
    assert_equal "Video Highlights", Links::Game::NhlVideoHighlights.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://video.nhl.com/videocenter/embed?playlist=2014021201-X-h"

    link = Links::Game::NhlVideoHighlights.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Game::NhlVideoHighlights.new.group
  end

  test "#position" do
    assert_equal 11, Links::Game::NhlVideoHighlights.new.position
  end

end
