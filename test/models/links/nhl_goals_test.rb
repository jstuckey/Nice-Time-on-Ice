require 'test_helper'

class Links::NhlGoalsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::NhlGoals.new.site_name
  end

  test "#description" do
    assert_equal "Goals", Links::NhlGoals.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.nhl.com/ice/playerstats.htm?gameType=2&position=S&season=20142015&sort=goals&status=A&team=WSH&viewName=goals"

    link = Links::NhlGoals.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::NhlGoals.new.group
  end

  test "#position" do
    assert_equal 2, Links::NhlGoals.new.position
  end

end
