require 'test_helper'

class Links::Misc::HcapBuyoutCalculatorTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey's Cap", Links::Misc::HcapBuyoutCalculator.new.site_name
  end

  test "#description" do
    assert_equal "Buyout Calculator", Links::Misc::HcapBuyoutCalculator.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "https://hockeyscap.com/buyout_calculator"

    link = Links::Misc::HcapBuyoutCalculator.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 8, Links::Misc::HcapBuyoutCalculator.new.group
  end

  test "#position" do
    assert_equal 1, Links::Misc::HcapBuyoutCalculator.new.position
  end

end
