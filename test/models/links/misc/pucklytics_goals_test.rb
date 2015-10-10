require 'test_helper'

class Links::Misc::PucklyticsGoalsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Pucklytics", Links::Misc::PucklyticsGoals.new.site_name
  end

  test "#description" do
    assert_equal "Goals", Links::Misc::PucklyticsGoals.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://puckalytics.com/skatergoalstats.html"

    link = Links::Misc::PucklyticsGoals.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Misc::PucklyticsGoals.new.group
  end

  test "#position" do
    assert_equal 0, Links::Misc::PucklyticsGoals.new.position
  end

end
