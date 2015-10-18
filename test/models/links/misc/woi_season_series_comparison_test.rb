require 'test_helper'

class Links::Misc::WoiSeasonSeriesComparisonTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "War-on-Ice", Links::Misc::WoiSeasonSeriesComparison.new.site_name
  end

  test "#description" do
    assert_equal "Season Series Comparison", Links::Misc::WoiSeasonSeriesComparison.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://war-on-ice.com/series.html"

    link = Links::Misc::WoiSeasonSeriesComparison.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 1, Links::Misc::WoiSeasonSeriesComparison.new.group
  end

  test "#position" do
    assert_equal 9, Links::Misc::WoiSeasonSeriesComparison.new.position
  end

end
