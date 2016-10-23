require 'test_helper'

class Links::Game::HockeyVizAwayTeamUsageTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey Viz", Links::Game::HockeyVizAwayTeamUsage.new.site_name
  end

  test "#description" do
    assert_equal "Away Player Usage", Links::Game::HockeyVizAwayTeamUsage.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://hockeyviz.com/game/2014021201/awayUsage"

    link = Links::Game::HockeyVizAwayTeamUsage.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 4, Links::Game::HockeyVizAwayTeamUsage.new.group
  end

  test "#position" do
    assert_equal 6, Links::Game::HockeyVizAwayTeamUsage.new.position
  end

end
