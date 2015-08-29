require 'test_helper'

class Links::NhlSpecialTeamsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL.com", Links::NhlSpecialTeams.new.site_name
  end

  test "#description" do
    assert_equal "Special Teams", Links::NhlSpecialTeams.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.nhl.com/ice/playerstats.htm?gameType=2&position=S&season=20142015&sort=powerPlayGoals&status=A&team=WSH&viewName=scoringLeaders"

    link = Links::NhlSpecialTeams.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 0, Links::NhlSpecialTeams.new.group
  end

  test "#position" do
    assert_equal 5, Links::NhlSpecialTeams.new.position
  end

end
