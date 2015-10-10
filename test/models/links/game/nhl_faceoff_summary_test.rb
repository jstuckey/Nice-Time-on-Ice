require 'test_helper'

class Links::Game::NhlFaceoffSummaryTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::Game::NhlFaceoffSummary.new.site_name
  end

  test "#description" do
    assert_equal "Faceoff Summary", Links::Game::NhlFaceoffSummary.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://www.nhl.com/scores/htmlreports/20142015/FC021201.HTM"

    link = Links::Game::NhlFaceoffSummary.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Game::NhlFaceoffSummary.new.group
  end

  test "#position" do
    assert_equal 5, Links::Game::NhlFaceoffSummary.new.position
  end

end
