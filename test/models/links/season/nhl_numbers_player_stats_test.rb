require 'test_helper'

class Links::Season::NhlNumbersPlayerStatsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL Numbers", Links::Season::NhlNumbersPlayerStats.new.site_name
  end

  test "#description" do
    assert_equal "Player Stats", Links::Season::NhlNumbersPlayerStats.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://stats.nhlnumbers.com/player_stats/year/2015"

    link = Links::Season::NhlNumbersPlayerStats.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 9, Links::Season::NhlNumbersPlayerStats.new.group
  end

  test "#position" do
    assert_equal 2, Links::Season::NhlNumbersPlayerStats.new.position
  end

end
