require 'test_helper'

class Links::Game::HockeyVizHomeTeamZoneTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey Viz", Links::Game::HockeyVizHomeTeamZone.new.site_name
  end

  test "#description" do
    assert_equal "Home Zone Deployment", Links::Game::HockeyVizHomeTeamZone.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://hockeyviz.com/game/2014021201/homeZone"

    link = Links::Game::HockeyVizHomeTeamZone.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 4, Links::Game::HockeyVizHomeTeamZone.new.group
  end

  test "#position" do
    assert_equal 7, Links::Game::HockeyVizHomeTeamZone.new.position
  end

end
