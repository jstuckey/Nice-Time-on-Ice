require 'test_helper'

class Links::Misc::SportracBuyoutCalculatorTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Sportrac", Links::Misc::SportracBuyoutCalculator.new.site_name
  end

  test "#description" do
    assert_equal "Buyout Calculator", Links::Misc::SportracBuyoutCalculator.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.spotrac.com/nhl/tools/buyout-calculator/"

    link = Links::Misc::SportracBuyoutCalculator.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 7, Links::Misc::SportracBuyoutCalculator.new.group
  end

  test "#position" do
    assert_equal 4, Links::Misc::SportracBuyoutCalculator.new.position
  end

end
