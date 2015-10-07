require 'test_helper'

class Links::Season::WoiPlayerComparisonTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "War-on-Ice", Links::Season::WoiPlayerComparison.new.site_name
  end

  test "#description" do
    assert_equal "Player Comparison", Links::Season::WoiPlayerComparison.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://war-on-ice.com/playertable.html?team=WSH&start0=20142015&end0=20142015"

    link = Links::Season::WoiPlayerComparison.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 5, Links::Season::WoiPlayerComparison.new.group
  end

  test "#position" do
    assert_equal 1, Links::Season::WoiPlayerComparison.new.position
  end

end
