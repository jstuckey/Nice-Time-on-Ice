require 'test_helper'

class Links::Misc::SportracFreeAgentsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Sportrac", Links::Misc::SportracFreeAgents.new.site_name
  end

  test "#description" do
    assert_equal "Free Agents", Links::Misc::SportracFreeAgents.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.spotrac.com/nhl/free-agents/"

    link = Links::Misc::SportracFreeAgents.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 7, Links::Misc::SportracFreeAgents.new.group
  end

  test "#position" do
    assert_equal 1, Links::Misc::SportracFreeAgents.new.position
  end

end
