require 'test_helper'

class Links::Misc::WoiTeamHextallyTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "War-on-Ice", Links::Misc::WoiTeamHextally.new.site_name
  end

  test "#description" do
    assert_equal "Team Hextally", Links::Misc::WoiTeamHextally.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://war-on-ice.com/hexteams.html"

    link = Links::Misc::WoiTeamHextally.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 1, Links::Misc::WoiTeamHextally.new.group
  end

  test "#position" do
    assert_equal 6, Links::Misc::WoiTeamHextally.new.position
  end

end
