require 'test_helper'

class Links::Season::HaPlayerRatingFenwickTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey Analysis", Links::Season::HaPlayerRatingFenwick.new.site_name
  end

  test "#description" do
    assert_equal "Player Ratings (Fenwick)", Links::Season::HaPlayerRatingFenwick.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://stats.hockeyanalysis.com/ratings.php?db=201415&sit=5v5&type=fenwick&teamid=30&pos=skaters&minutes=50&disp=1"

    link = Links::Season::HaPlayerRatingFenwick.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 3, Links::Season::HaPlayerRatingFenwick.new.group
  end

  test "#position" do
    assert_equal 1, Links::Season::HaPlayerRatingFenwick.new.position
  end

end
