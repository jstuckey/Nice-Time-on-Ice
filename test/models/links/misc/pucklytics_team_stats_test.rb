require 'test_helper'

class Links::Misc::PucklyticsTeamStatsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Pucklytics", Links::Misc::PucklyticsTeamStats.new.site_name
  end

  test "#description" do
    assert_equal "Team Stats", Links::Misc::PucklyticsTeamStats.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://puckalytics.com/teamstats.html"

    link = Links::Misc::PucklyticsTeamStats.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Misc::PucklyticsTeamStats.new.group
  end

  test "#position" do
    assert_equal 5, Links::Misc::PucklyticsTeamStats.new.position
  end

end
