require 'test_helper'

class Links::Misc::ScMatchupsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Sporting Charts", Links::Misc::ScMatchups.new.site_name
  end

  test "#description" do
    assert_equal "Matchups", Links::Misc::ScMatchups.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.sportingcharts.com/nhl/rivalrylisting/"

    link = Links::Misc::ScMatchups.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 4, Links::Misc::ScMatchups.new.group
  end

  test "#position" do
    assert_equal 3, Links::Misc::ScMatchups.new.position
  end

end
