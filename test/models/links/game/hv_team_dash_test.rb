require 'test_helper'

class Links::Game::HvTeamDashTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey Viz", Links::Game::HvTeamDash.new.site_name
  end

  test "#description" do
    assert_equal "Team Overview", Links::Game::HvTeamDash.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://hockeyviz.com/team/WSH/1415"

    link = Links::Game::HvTeamDash.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 4, Links::Game::HvTeamDash.new.group
  end

  test "#position" do
    assert_equal 0, Links::Game::HvTeamDash.new.position
  end

end
