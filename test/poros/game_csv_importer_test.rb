
require 'test_helper'

class GameCSVImporterTest < ActiveSupport::TestCase

  CSV_PATH = File.join(Rails.root, 'test', 'fixtures', 'import.csv')

  test "should create a new game database record" do
    assert_difference "Game.count" do
      GameCSVImporter.new(CSV_PATH).import
    end
  end

  test "should create game with attributes matching the csv file" do
    Game.destroy_all
    GameCSVImporter.new(CSV_PATH).import
    game = Game.last

    assert_equal 2014, game.season.year_start
    assert_equal 2015, game.season.year_end
    assert_equal 2014030146, game.game_number
    assert_equal Date.new(2015, 4, 25), game.date
    assert game.playoffs?
    assert_equal teams(:caps), game.away_team
    assert_equal teams(:islanders), game.home_team
  end
end
