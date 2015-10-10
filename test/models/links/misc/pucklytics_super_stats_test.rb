require 'test_helper'

class Links::Misc::PucklyticsSuperStatsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Pucklytics", Links::Misc::PucklyticsSuperStats.new.site_name
  end

  test "#description" do
    assert_equal "Super Stats Table", Links::Misc::PucklyticsSuperStats.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://puckalytics.com/skatersuperstats.html"

    link = Links::Misc::PucklyticsSuperStats.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Misc::PucklyticsSuperStats.new.group
  end

  test "#position" do
    assert_equal 3, Links::Misc::PucklyticsSuperStats.new.position
  end

end
