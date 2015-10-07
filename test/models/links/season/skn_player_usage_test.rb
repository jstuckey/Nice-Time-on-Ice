require 'test_helper'

class Links::Season::SknPlayerUsageTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Some Kind of Ninja", Links::Season::SknPlayerUsage.new.site_name
  end

  test "#description" do
    assert_equal "Player Usage Chart", Links::Season::SknPlayerUsage.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://somekindofninja.com/nhl/usage.php?f1=2014_s&f2=5v5&f3=&f5=WSH&f4=&f7=&update-filters=Update+Results"

    link = Links::Season::SknPlayerUsage.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 4, Links::Season::SknPlayerUsage.new.group
  end

  test "#position" do
    assert_equal 0, Links::Season::SknPlayerUsage.new.position
  end

end
