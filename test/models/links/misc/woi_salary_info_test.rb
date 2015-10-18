require 'test_helper'

class Links::Misc::WoiSalaryInfoTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "War-on-Ice", Links::Misc::WoiSalaryInfo.new.site_name
  end

  test "#description" do
    assert_equal "Salary Information", Links::Misc::WoiSalaryInfo.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://war-on-ice.com/cap/WSH.html"

    link = Links::Misc::WoiSalaryInfo.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 1, Links::Misc::WoiSalaryInfo.new.group
  end

  test "#position" do
    assert_equal 0, Links::Misc::WoiSalaryInfo.new.position
  end

end
