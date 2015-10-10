require 'test_helper'

class Links::Season::SportracPayrollTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Sportrac", Links::Season::SportracPayroll.new.site_name
  end

  test "#description" do
    assert_equal "Team Payroll", Links::Season::SportracPayroll.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.spotrac.com/nhl/washington-capitals/cap/2014/"

    link = Links::Season::SportracPayroll.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 7, Links::Season::SportracPayroll.new.group
  end

  test "#position" do
    assert_equal 0, Links::Season::SportracPayroll.new.position
  end

end
