require 'test_helper'

class Links::Misc::HcapFreeAgentsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey's Cap", Links::Misc::HcapFreeAgents.new.site_name
  end

  test "#description" do
    assert_equal "Free Agents", Links::Misc::HcapFreeAgents.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "https://hockeyscap.com/browse/free_agent"

    link = Links::Misc::HcapFreeAgents.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 8, Links::Misc::HcapFreeAgents.new.group
  end

  test "#position" do
    assert_equal 3, Links::Misc::HcapFreeAgents.new.position
  end

end
