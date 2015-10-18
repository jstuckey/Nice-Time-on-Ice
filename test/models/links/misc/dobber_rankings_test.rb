require 'test_helper'

class Links::Misc::DobberRankingsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Dobber Hockey", Links::Misc::DobberRankings.new.site_name
  end

  test "#description" do
    assert_equal "Rankings", Links::Misc::DobberRankings.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.dobberhockey.com/Table/Hockey-home/Hockey-Rankings/"

    link = Links::Misc::DobberRankings.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 3, Links::Misc::DobberRankings.new.group
  end

  test "#position" do
    assert_equal 1, Links::Misc::DobberRankings.new.position
  end

end
