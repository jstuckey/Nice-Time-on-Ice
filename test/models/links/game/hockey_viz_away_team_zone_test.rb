require 'test_helper'

class Links::Game::HockeyVizAwayTeamZoneTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey Viz", Links::Game::HockeyVizAwayTeamZone.new.site_name
  end

  test "#description" do
    assert_equal "Away Zone Deployment", Links::Game::HockeyVizAwayTeamZone.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://hockeyviz.com/game/2014021201/awayZone"

    link = Links::Game::HockeyVizAwayTeamZone.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 4, Links::Game::HockeyVizAwayTeamZone.new.group
  end

  test "#position" do
    assert_equal 9, Links::Game::HockeyVizAwayTeamZone.new.position
  end

end
