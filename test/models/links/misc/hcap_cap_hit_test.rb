require 'test_helper'

class Links::Misc::HcapCapHitTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey's Cap", Links::Misc::HcapCapHit.new.site_name
  end

  test "#description" do
    assert_equal "Cap Hits", Links::Misc::HcapCapHit.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "https://hockeyscap.com/teams/capitals"

    link = Links::Misc::HcapCapHit.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 8, Links::Misc::HcapCapHit.new.group
  end

  test "#position" do
    assert_equal 0, Links::Misc::HcapCapHit.new.position
  end

end
