require 'test_helper'

class Links::Misc::HcapEntryLevelContractsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey's Cap", Links::Misc::HcapEntryLevelContracts.new.site_name
  end

  test "#description" do
    assert_equal "Entry Level Contracts", Links::Misc::HcapEntryLevelContracts.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "https://hockeyscap.com/browse/elc"

    link = Links::Misc::HcapEntryLevelContracts.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 7, Links::Misc::HcapEntryLevelContracts.new.group
  end

  test "#position" do
    assert_equal 5, Links::Misc::HcapEntryLevelContracts.new.position
  end

end
