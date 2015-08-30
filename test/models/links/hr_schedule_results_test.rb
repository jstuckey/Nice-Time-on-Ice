require 'test_helper'

class Links::HrScheduleResultsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey-Reference", Links::HrScheduleResults.new.site_name
  end

  test "#description" do
    assert_equal "Schedule and Results", Links::HrScheduleResults.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.hockey-reference.com/teams/WSH/2015_games.html"

    link = Links::HrScheduleResults.new(team: team, season: season)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::HrScheduleResults.new.group
  end

  test "#position" do
    assert_equal 1, Links::HrScheduleResults.new.position
  end

end
