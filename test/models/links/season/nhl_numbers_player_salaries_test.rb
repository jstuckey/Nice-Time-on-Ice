require 'test_helper'

class Links::Season::NhlNumbersPlayerSalariesTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "NHL Numbers", Links::Season::NhlNumbersPlayerSalaries.new.site_name
  end

  test "#description" do
    assert_equal "Player Salaries", Links::Season::NhlNumbersPlayerSalaries.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://stats.nhlnumbers.com/players?year=2015"

    link = Links::Season::NhlNumbersPlayerSalaries.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 9, Links::Season::NhlNumbersPlayerSalaries.new.group
  end

  test "#position" do
    assert_equal 1, Links::Season::NhlNumbersPlayerSalaries.new.position
  end

end
