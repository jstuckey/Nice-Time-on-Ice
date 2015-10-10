require 'test_helper'

class Links::Season::QuantTeamStatsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Quant Hockey", Links::Season::QuantTeamStats.new.site_name
  end

  test "#description" do
    assert_equal "Team Stats", Links::Season::QuantTeamStats.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.quanthockey.com/nhl/teams/washington-capitals-players-2014-15-nhl-stats.html"

    link = Links::Season::QuantTeamStats.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#url for playoffs" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "playoffs"

    url = "http://www.quanthockey.com/nhl/teams/washington-capitals-players-2014-15-playoff-nhl-stats.html"

    link = Links::Season::QuantTeamStats.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 8, Links::Season::QuantTeamStats.new.group
  end

  test "#position" do
    assert_equal 0, Links::Season::QuantTeamStats.new.position
  end

end
