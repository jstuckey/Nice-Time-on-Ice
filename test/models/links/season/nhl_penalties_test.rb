require 'test_helper'

class Links::Season::NhlPenaltiesTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::Season::NhlPenalties.new.site_name
  end

  test "#description" do
    assert_equal "Penalties", Links::Season::NhlPenalties.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.nhl.com/ice/playerstats.htm?gameType=2&position=S&season=20142015&sort=penaltyMinutes&status=A&team=WSH&viewName=penalties"

    link = Links::Season::NhlPenalties.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::Season::NhlPenalties.new.group
  end

  test "#position" do
    assert_equal 4, Links::Season::NhlPenalties.new.position
  end

end
