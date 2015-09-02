require 'test_helper'

class Links::Season::HaPlayerRatingGoalsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Hockey Analysis", Links::Season::HaPlayerRatingGoals.new.site_name
  end

  test "#description" do
    assert_equal "Player Ratings (Goals)", Links::Season::HaPlayerRatingGoals.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://stats.hockeyanalysis.com/ratings.php?db=201415&sit=5v5&type=goals&teamid=30&pos=skaters&minutes=50&disp=1"

    link = Links::Season::HaPlayerRatingGoals.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 3, Links::Season::HaPlayerRatingGoals.new.group
  end

  test "#position" do
    assert_equal 0, Links::Season::HaPlayerRatingGoals.new.position
  end

end
