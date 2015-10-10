require 'test_helper'

class Links::Misc::HcapWaiverCalculatorTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey's Cap", Links::Misc::HcapWaiverCalculator.new.site_name
  end

  test "#description" do
    assert_equal "Waivers Calculator", Links::Misc::HcapWaiverCalculator.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "https://hockeyscap.com/waivers_calculator"

    link = Links::Misc::HcapWaiverCalculator.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 7, Links::Misc::HcapWaiverCalculator.new.group
  end

  test "#position" do
    assert_equal 2, Links::Misc::HcapWaiverCalculator.new.position
  end

end
