require 'test_helper'

class Links::Misc::AbstractOtherDataTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey Abstract", Links::Misc::AbstractOtherData.new.site_name
  end

  test "#description" do
    assert_equal "Other Data", Links::Misc::AbstractOtherData.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.hockeyabstract.com/testimonials"

    link = Links::Misc::AbstractOtherData.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 1, Links::Misc::AbstractOtherData.new.group
  end

  test "#position" do
    assert_equal 2, Links::Misc::AbstractOtherData.new.position
  end

end
