require 'test_helper'

class Links::Season::HaIndividualStatsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey Analysis", Links::Season::HaIndividualStats.new.site_name
  end

  test "#description" do
    assert_equal "Individual Stats", Links::Season::HaIndividualStats.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://stats.hockeyanalysis.com/ratings.php?db=201415&sit=5v5&type=individual&teamid=30&pos=skaters&minutes=50&disp=1"

    link = Links::Season::HaIndividualStats.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 3, Links::Season::HaIndividualStats.new.group
  end

  test "#position" do
    assert_equal 2, Links::Season::HaIndividualStats.new.position
  end

end
