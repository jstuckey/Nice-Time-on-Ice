require 'test_helper'

class Links::Misc::PucklyticsGoalieStatsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Pucklytics", Links::Misc::PucklyticsGoalieStats.new.site_name
  end

  test "#description" do
    assert_equal "Goalie Stats", Links::Misc::PucklyticsGoalieStats.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "https://puckalytics.com/#/goalies?season=201415"

    link = Links::Misc::PucklyticsGoalieStats.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Misc::PucklyticsGoalieStats.new.group
  end

  test "#position" do
    assert_equal 1, Links::Misc::PucklyticsGoalieStats.new.position
  end

end
