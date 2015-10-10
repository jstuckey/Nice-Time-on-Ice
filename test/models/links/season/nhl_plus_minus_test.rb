require 'test_helper'

class Links::Season::NhlPlusMinusTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::Season::NhlPlusMinus.new.site_name
  end

  test "#description" do
    assert_equal "Plus/Minus", Links::Season::NhlPlusMinus.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=plusminus"

    link = Links::Season::NhlPlusMinus.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Season::NhlPlusMinus.new.group
  end

  test "#position" do
    assert_equal 5, Links::Season::NhlPlusMinus.new.position
  end

end
