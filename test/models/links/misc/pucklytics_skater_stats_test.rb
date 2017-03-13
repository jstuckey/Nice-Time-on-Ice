require 'test_helper'

class Links::Misc::PucklyticsSkaterStatsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Pucklytics", Links::Misc::PucklyticsSkaterStats.new.site_name
  end

  test "#description" do
    assert_equal "Skater Stats", Links::Misc::PucklyticsSkaterStats.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "https://puckalytics.com/#/skaters?season=201415"

    link = Links::Misc::PucklyticsSkaterStats.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Misc::PucklyticsSkaterStats.new.group
  end

  test "#position" do
    assert_equal 0, Links::Misc::PucklyticsSkaterStats.new.position
  end

end
