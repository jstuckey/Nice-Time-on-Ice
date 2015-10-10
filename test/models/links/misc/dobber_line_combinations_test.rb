require 'test_helper'

class Links::Misc::DobberLineCombinationsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Dobber Hockey", Links::Misc::DobberLineCombinations.new.site_name
  end

  test "#description" do
    assert_equal "Line Combinations", Links::Misc::DobberLineCombinations.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.dobberhockey.com/frozenpool_last3gamelines.php"

    link = Links::Misc::DobberLineCombinations.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 2, Links::Misc::DobberLineCombinations.new.group
  end

  test "#position" do
    assert_equal 0, Links::Misc::DobberLineCombinations.new.position
  end

end
