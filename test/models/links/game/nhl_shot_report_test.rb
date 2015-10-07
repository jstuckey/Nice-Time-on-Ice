require 'test_helper'

class Links::Game::NhlShotReportTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::Game::NhlShotReport.new.site_name
  end

  test "#description" do
    assert_equal "Shot Report", Links::Game::NhlShotReport.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://www.nhl.com/scores/htmlreports/20142015/SS021217.HTM"

    link = Links::Game::NhlShotReport.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Game::NhlShotReport.new.group
  end

  test "#position" do
    assert_equal 10, Links::Game::NhlShotReport.new.position
  end

end
