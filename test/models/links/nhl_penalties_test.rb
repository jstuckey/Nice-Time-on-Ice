require 'test_helper'

class Links::NhlPenaltiesTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::NhlPenalties.new.site_name
  end

  test "#description" do
    assert_equal "Penalties", Links::NhlPenalties.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.nhl.com/ice/playerstats.htm?gameType=2&position=S&season=20142015&sort=penaltyMinutes&status=A&team=WSH&viewName=penalties"

    link = Links::NhlPenalties.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::NhlPenalties.new.group
  end

  test "#position" do
    assert_equal 4, Links::NhlPenalties.new.position
  end

end
