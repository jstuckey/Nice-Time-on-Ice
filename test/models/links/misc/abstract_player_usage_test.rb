require 'test_helper'

class Links::Misc::AbstractPlayerUsageTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey Abstract", Links::Misc::AbstractPlayerUsage.new.site_name
  end

  test "#description" do
    assert_equal "Player Usage Charts", Links::Misc::AbstractPlayerUsage.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.hockeyabstract.com/playerusagecharts"

    link = Links::Misc::AbstractPlayerUsage.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 2, Links::Misc::AbstractPlayerUsage.new.group
  end

  test "#position" do
    assert_equal 0, Links::Misc::AbstractPlayerUsage.new.position
  end

end
