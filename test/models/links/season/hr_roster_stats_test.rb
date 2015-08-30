require 'test_helper'

class Links::Season::HrRosterStatsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey-Reference", Links::Season::HrRosterStats.new.site_name
  end

  test "#description" do
    assert_equal "Roster and Statistics", Links::Season::HrRosterStats.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.hockey-reference.com/teams/WSH/2015.html"

    link = Links::Season::HrRosterStats.new(team: team, season: season)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Season::HrRosterStats.new.group
  end

  test "#position" do
    assert_equal 0, Links::Season::HrRosterStats.new.position
  end

end
