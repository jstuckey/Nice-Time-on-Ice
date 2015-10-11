require 'test_helper'

class Links::Season::NhlNumbersFreeAgentsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL Numbers", Links::Season::NhlNumbersFreeAgents.new.site_name
  end

  test "#description" do
    assert_equal "Free Agents", Links::Season::NhlNumbersFreeAgents.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://stats.nhlnumbers.com/free_agents?year=2015"

    link = Links::Season::NhlNumbersFreeAgents.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 9, Links::Season::NhlNumbersFreeAgents.new.group
  end

  test "#position" do
    assert_equal 3, Links::Season::NhlNumbersFreeAgents.new.position
  end

end
