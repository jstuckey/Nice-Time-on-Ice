require 'test_helper'

class GameBuilderTest < ActiveSupport::TestCase
  def setup
    @season = seasons(:fourteen)
    @team1 = teams(:pens)
    @team2 = teams(:caps)
  end

  test "should accept year_start as a number" do
    data = GameBuilder.new(year_start: 2014)
    game = data.to_game
    assert_equal @season, game.season
  end

  test "should accept year_start as a string" do
    data = GameBuilder.new(year_start: "2014")
    game = data.to_game
    assert_equal @season, game.season
  end

  test "should alias season to year_start as a number" do
    data = GameBuilder.new(season: 2014)
    game = data.to_game
    assert_equal @season, game.season
  end

  test "should alias season to year_start as a string" do
    data = GameBuilder.new(season: "2014")
    game = data.to_game
    assert_equal @season, game.season
  end

  test "should accept away_team as an abbreviation" do
    data = GameBuilder.new(away_team: @team1.abbreviation)
    game = data.to_game
    assert_equal @team1, game.away_team
  end

  test "should accept home_team as an abbreviation" do
    data = GameBuilder.new(home_team: @team2.abbreviation)
    game = data.to_game
    assert_equal @team2, game.home_team
  end

  test "should accept away_team as a name" do
    data = GameBuilder.new(away_team: @team1.name)
    game = data.to_game
    assert_equal @team1, game.away_team
  end

  test "should accept home_team as a name" do
    data = GameBuilder.new(home_team: @team2.name)
    game = data.to_game
    assert_equal @team2, game.home_team
  end

  test "should accept away_team as a name with special characters" do
    data = GameBuilder.new(away_team: "Montréal Canadiens")
    game = data.to_game
    assert_equal teams(:habs), game.away_team
  end

  test "should accept home_team as a name with special characters" do
    data = GameBuilder.new(home_team: "Montréal Canadiens")
    game = data.to_game
    assert_equal teams(:habs), game.home_team
  end

  test "should alias away to away_team as an abbreviation" do
    data = GameBuilder.new(away: @team1.abbreviation)
    game = data.to_game
    assert_equal @team1, game.away_team
  end

  test "should alias home to home_team as an abbreviation" do
    data = GameBuilder.new(home: @team2.abbreviation)
    game = data.to_game
    assert_equal @team2, game.home_team
  end

  test "should accept game_number as a number" do
    data = GameBuilder.new(game_number: 2014020709)
    game = data.to_game
    assert_equal 2014020709, game.game_number
  end

  test "should accept game_number as a string" do
    data = GameBuilder.new(game_number: "2014020709")
    game = data.to_game
    assert_equal 2014020709, game.game_number
  end

  test "should alias number to game_number as a number" do
    data = GameBuilder.new(number: 2014020709)
    game = data.to_game
    assert_equal 2014020709, game.game_number
  end

  test "should alias number to game_number as a string" do
    data = GameBuilder.new(number: "2014020709")
    game = data.to_game
    assert_equal 2014020709, game.game_number
  end

  test "should accept a date" do
    data = GameBuilder.new(date: Date.new(2015, 1, 28))
    game = data.to_game
    assert_equal Date.new(2015, 1, 28), game.date
  end

  test "should accept a date when given a string" do
    data = GameBuilder.new(date: "Jan 28, 2015")
    game = data.to_game
    assert_equal Date.new(2015, 1, 28), game.date
  end

  test "should default playoffs? to false" do
    data = GameBuilder.new
    game = data.to_game
    refute game.playoffs?
  end

  test "should accept is_playoffs as a falsey boolean" do
    data = GameBuilder.new(is_playoffs: false)
    game = data.to_game
    refute game.playoffs?
  end

  test "should accept is_playoffs as a falsey string" do
    data = GameBuilder.new(is_playoffs: "false")
    game = data.to_game
    refute game.playoffs?
  end

  test "should accept is_playoffs as a truthy boolean" do
    data = GameBuilder.new(is_playoffs: true)
    game = data.to_game
    assert game.playoffs?
  end

  test "should accept is_playoffs as a truthy string" do
    data = GameBuilder.new(is_playoffs: "true")
    game = data.to_game
    assert game.playoffs?
  end

  test "should be able to save returned game if all data is supplied" do
    data = GameBuilder.new(year_start: "2014",
                           game_number: "2014020709",
                           away_team: "PIT",
                           home_team: "WSH",
                           date: "Jan 28, 2015",
                           is_playoffs: "false")
    game = data.to_game
    assert game.save
  end
end
