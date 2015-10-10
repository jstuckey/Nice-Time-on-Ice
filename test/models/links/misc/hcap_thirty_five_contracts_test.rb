require 'test_helper'

class Links::Misc::HcapThirtyFiveContractsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey's Cap", Links::Misc::HcapThirtyFiveContracts.new.site_name
  end

  test "#description" do
    assert_equal "35+ Contracts", Links::Misc::HcapThirtyFiveContracts.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "https://hockeyscap.com/browse/35_plus"

    link = Links::Misc::HcapThirtyFiveContracts.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 7, Links::Misc::HcapThirtyFiveContracts.new.group
  end

  test "#position" do
    assert_equal 4, Links::Misc::HcapThirtyFiveContracts.new.position
  end

end
