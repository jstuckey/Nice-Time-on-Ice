require 'test_helper'

class Links::Misc::RinkStatsWinProbTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Rink Stats", Links::Misc::RinkStatsWinProb.new.site_name
  end

  test "#description" do
    assert_equal "Win Probability", Links::Misc::RinkStatsWinProb.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://rinkstats.com/winprobs/gameapp/"

    link = Links::Misc::RinkStatsWinProb.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 4, Links::Misc::RinkStatsWinProb.new.group
  end

  test "#position" do
    assert_equal 0, Links::Misc::RinkStatsWinProb.new.position
  end

end
