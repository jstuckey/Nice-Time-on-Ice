require 'test_helper'

class Links::Season::HrScheduleResultsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey-Reference", Links::Season::HrScheduleResults.new.site_name
  end

  test "#description" do
    assert_equal "Schedule and Results", Links::Season::HrScheduleResults.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.hockey-reference.com/teams/WSH/2015_games.html"

    link = Links::Season::HrScheduleResults.new(team: team, season: season)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 1, Links::Season::HrScheduleResults.new.group
  end

  test "#position" do
    assert_equal 1, Links::Season::HrScheduleResults.new.position
  end

end
