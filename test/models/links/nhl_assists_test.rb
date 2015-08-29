require 'test_helper'

class Links::NhlAssistsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::NhlAssists.new.site_name
  end

  test "#description" do
    assert_equal "Assists", Links::NhlAssists.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.nhl.com/ice/playerstats.htm?gameType=2&position=S&season=20142015&sort=assists&status=A&team=WSH&viewName=assists"

    link = Links::NhlAssists.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::NhlAssists.new.group
  end

  test "#position" do
    assert_equal 3, Links::NhlAssists.new.position
  end

end
