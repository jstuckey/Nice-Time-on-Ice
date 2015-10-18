require 'test_helper'

class Links::Misc::WoiStandingsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "War-on-Ice", Links::Misc::WoiStandings.new.site_name
  end

  test "#description" do
    assert_equal "Standings", Links::Misc::WoiStandings.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://war-on-ice.com/standings.html"

    link = Links::Misc::WoiStandings.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 1, Links::Misc::WoiStandings.new.group
  end

  test "#position" do
    assert_equal 8, Links::Misc::WoiStandings.new.position
  end

end
