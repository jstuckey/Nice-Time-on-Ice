require 'test_helper'

class Links::Misc::SportracSalaryRankingsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Sportrac", Links::Misc::SportracSalaryRankings.new.site_name
  end

  test "#description" do
    assert_equal "Salary Rankings", Links::Misc::SportracSalaryRankings.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.spotrac.com/nhl/rankings/"

    link = Links::Misc::SportracSalaryRankings.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 7, Links::Misc::SportracSalaryRankings.new.group
  end

  test "#position" do
    assert_equal 1, Links::Misc::SportracSalaryRankings.new.position
  end

end
