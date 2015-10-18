require 'test_helper'

class Links::Misc::WoiWinsAboveReplacementTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "War-on-Ice", Links::Misc::WoiWinsAboveReplacement.new.site_name
  end

  test "#description" do
    assert_equal "Wins Above Replacement", Links::Misc::WoiWinsAboveReplacement.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://war-on-ice.com/WARboard.html"

    link = Links::Misc::WoiWinsAboveReplacement.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 1, Links::Misc::WoiWinsAboveReplacement.new.group
  end

  test "#position" do
    assert_equal 7, Links::Misc::WoiWinsAboveReplacement.new.position
  end

end
