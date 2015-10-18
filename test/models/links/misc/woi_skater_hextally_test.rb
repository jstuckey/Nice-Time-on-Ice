require 'test_helper'

class Links::Misc::WoiSkaterHextallyTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "War-on-Ice", Links::Misc::WoiSkaterHextally.new.site_name
  end

  test "#description" do
    assert_equal "Skater Hextally", Links::Misc::WoiSkaterHextally.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://war-on-ice.com/hexplayers.html"

    link = Links::Misc::WoiSkaterHextally.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 1, Links::Misc::WoiSkaterHextally.new.group
  end

  test "#position" do
    assert_equal 2, Links::Misc::WoiSkaterHextally.new.position
  end

end
