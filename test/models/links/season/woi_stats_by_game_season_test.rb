require 'test_helper'

class Links::Season::WoiStatsByGameSeasonTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "War-on-Ice", Links::Season::WoiStatsByGameSeason.new.site_name
  end

  test "#description" do
    assert_equal "Stats by Game/Season", Links::Season::WoiStatsByGameSeason.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://war-on-ice.com/teambygame.html?team=WSH"

    link = Links::Season::WoiStatsByGameSeason.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 5, Links::Season::WoiStatsByGameSeason.new.group
  end

  test "#position" do
    assert_equal 0, Links::Season::WoiStatsByGameSeason.new.position
  end

end
