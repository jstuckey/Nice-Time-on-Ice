require 'test_helper'

class Links::Misc::HrAdvancedStatFinderTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey-Reference", Links::Misc::HrAdvancedStatFinder.new.site_name
  end

  test "#description" do
    assert_equal "Advanced Stats Finder", Links::Misc::HrAdvancedStatFinder.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.hockey-reference.com/play-index/tpbp_finder.cgi"

    link = Links::Misc::HrAdvancedStatFinder.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 9, Links::Misc::HrAdvancedStatFinder.new.group
  end

  test "#position" do
    assert_equal 0, Links::Misc::HrAdvancedStatFinder.new.position
  end

end
