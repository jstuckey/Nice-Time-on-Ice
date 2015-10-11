require 'test_helper'

class Links::Season::NhlNumbersTeamSalaryTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL Numbers", Links::Season::NhlNumbersTeamSalary.new.site_name
  end

  test "#description" do
    assert_equal "Team Salary", Links::Season::NhlNumbersTeamSalary.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://stats.nhlnumbers.com/teams/WAS?year=2015"

    link = Links::Season::NhlNumbersTeamSalary.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 9, Links::Season::NhlNumbersTeamSalary.new.group
  end

  test "#position" do
    assert_equal 0, Links::Season::NhlNumbersTeamSalary.new.position
  end

end
