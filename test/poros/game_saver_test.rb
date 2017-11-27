require 'test_helper'

class GameSaverTest < ActiveSupport::TestCase
  test "should save game objects to database" do
    game = build_game

    GameSaver.new(game).call

    new_games = Game.where(game_number: TEST_GAME_NUMBER)
    assert new_games.present?, "Could not find saved game"
    assert_equal 1, new_games.size
  end

  test "should return success messages" do
    game = build_game

    results = GameSaver.new(game).call.results

    assert_equal "Saved game #{TEST_GAME_NUMBER}", results.first
  end

  test "should return error messages" do
    game = build_game
    game.date = nil

    results = GameSaver.new(game).call.results

    expected =  "Error saving game #{TEST_GAME_NUMBER}: Date can't be blank"
    assert_equal expected, results.first
  end

  test "should change a game's date if it already exists" do
    old_game = build_game
    old_game.save!
    game = build_game
    new_date = Date.current
    game.date = new_date

    results = GameSaver.new(game).call.results

    expected = "Updated date for game #{TEST_GAME_NUMBER}"
    assert_equal expected, results.first
    assert_equal new_date, old_game.reload.date
  end

  private

  TEST_GAME_NUMBER = 201502999

  def build_game
   builder = GameBuilder.new
   builder.year_start = 2014
   builder.game_number = TEST_GAME_NUMBER
   builder.away_team = "PIT"
   builder.home_team = "WSH"
   builder.date = 1.day.ago
   builder.is_playoffs = false
   builder.to_game
  end
end
