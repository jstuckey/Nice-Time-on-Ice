require 'test_helper'

class Links::Game::NulliEvenStrengthShootingTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Nullisecund", Links::Game::NulliEvenStrengthShooting.new.site_name
  end

  test "#description" do
    assert_equal "Even Strength Shooting", Links::Game::NulliEvenStrengthShooting.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game = games(:game_one)
    game_type = "regular"

    url = "http://nullisecund.us/nhl/game.php?id=21217"

    link = Links::Game::NulliEvenStrengthShooting.new(team: team, season: season, game: game, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 1, Links::Game::NulliEvenStrengthShooting.new.group
  end

  test "#position" do
    assert_equal 0, Links::Game::NulliEvenStrengthShooting.new.position
  end

end
