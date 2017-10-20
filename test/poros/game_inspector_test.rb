require 'test_helper'

class GameInspectorTest < ActiveSupport::TestCase
  test "should find missing regular season game" do
    Game.destroy_all
    create_game(2014020001)
    create_game(2014020003)

    assert_equal [2014020002], GameInspector.new(2014).missing_games
  end

  test "should find multiple missing regular season games in a row" do
    Game.destroy_all
    create_game(2014020001)
    create_game(2014020002)
    create_game(2014020006)

    expected = [2014020003, 2014020004, 2014020005]
    assert_equal expected, GameInspector.new(2014).missing_games
  end

#  test "should find missing post season game" do

#    create_game(2014030111)
#    create_game(2014030113)
#
#    assert_equal [2014030112], GameInspector.new(2014).missing_games
#  end
#
#  test "should find multiple missing post season games in a row" do
#    Game.destroy_all
#    create_game(2014030111)
#    create_game(2014030112)
#    create_game(2014030116)
#
#    expected = [2014030113, 2014030114, 2014030115]
#    assert_equal expected, GameInspector.new(2014).missing_games
#  end
#
#  test "should find missing post season games across multiple rounds" do
#    Game.destroy_all
#    create_game(2014030111)
#    create_game(2014030113)
#    create_game(2014030211)
#    create_game(2014030213)
#    create_game(2014030311)
#    create_game(2014030313)
#    create_game(2014030411)
#    create_game(2014030413)
#
#    expected = [2014030112, 2014030212, 2014030312, 2014030412]
#    assert_equal expected, GameInspector.new(2014).missing_games
#  end
#
  test "should return empty list if no missing games" do
    Game.destroy_all
    create_game(2014020001)
    create_game(2014020002)
#    create_game(2014030111)
#    create_game(2014030112)
#    create_game(2014030211)
#    create_game(2014030212)
#    create_game(2014030311)
#    create_game(2014030312)
#    create_game(2014030411)
#    create_game(2014030412)

    assert_equal [], GameInspector.new(2014).missing_games
  end

  test "should return empty list if no season exists" do
    assert_equal [], GameInspector.new(2000).missing_games
  end

  private

  def create_game(game_number)
    season = get_season(game_number)
    Game.create!(game_number: game_number,
                 date: Date.new,
                 playoffs: playoffs?(game_number),
                 away_team: teams(:pens),
                 home_team: teams(:caps),
                 season: season)
  end

  def get_season(game_number)
    if game_number.to_s[0..4] == 2013
      seasons(:thirteen)
    else
      seasons(:fourteen)
    end
  end

  def playoffs?(game_number)
    !!(/\d\d\d\d03\d\d\d\d/ =~ game_number.to_s)
  end
end
