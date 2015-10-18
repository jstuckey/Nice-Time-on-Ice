require 'test_helper'

class Links::Misc::WoiSkaterHistoryTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "War-on-Ice", Links::Misc::WoiSkaterHistory.new.site_name
  end

  test "#description" do
    assert_equal "Skater History", Links::Misc::WoiSkaterHistory.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://war-on-ice.com/playerseason.html"

    link = Links::Misc::WoiSkaterHistory.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 1, Links::Misc::WoiSkaterHistory.new.group
  end

  test "#position" do
    assert_equal 1, Links::Misc::WoiSkaterHistory.new.position
  end

end
