require 'test_helper'

class Links::Season::QuantPlayerStatsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Quant Hockey", Links::Season::QuantPlayerStats.new.site_name
  end

  test "#description" do
    assert_equal "Player Stats", Links::Season::QuantPlayerStats.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.quanthockey.com/nhl/seasons/2014-15-nhl-players-stats.html"

    link = Links::Season::QuantPlayerStats.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#url for playoffs" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "playoffs"

    url = "http://www.quanthockey.com/nhl/seasons/2014-15-nhl-players-playoff-stats.html"

    link = Links::Season::QuantPlayerStats.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 8, Links::Season::QuantPlayerStats.new.group
  end

  test "#position" do
    assert_equal 1, Links::Season::QuantPlayerStats.new.position
  end

end
