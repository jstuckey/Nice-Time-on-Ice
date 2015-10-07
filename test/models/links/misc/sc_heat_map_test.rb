require 'test_helper'

class Links::Misc::ScHeatMapTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Sporting Charts", Links::Misc::ScHeatMap.new.site_name
  end

  test "#description" do
    assert_equal "Player Heat Map", Links::Misc::ScHeatMap.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.sportingcharts.com/nhl/icetrack/"

    link = Links::Misc::ScHeatMap.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 3, Links::Misc::ScHeatMap.new.group
  end

  test "#position" do
    assert_equal 0, Links::Misc::ScHeatMap.new.position
  end

end
