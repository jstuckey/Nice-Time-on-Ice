require 'test_helper'

class Links::Misc::AbstractLuckCalculatorTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey Abstract", Links::Misc::AbstractLuckCalculator.new.site_name
  end

  test "#description" do
    assert_equal "Luck Calculator", Links::Misc::AbstractLuckCalculator.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.hockeyabstract.com/luck"

    link = Links::Misc::AbstractLuckCalculator.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 2, Links::Misc::AbstractLuckCalculator.new.group
  end

  test "#position" do
    assert_equal 1, Links::Misc::AbstractLuckCalculator.new.position
  end

end
