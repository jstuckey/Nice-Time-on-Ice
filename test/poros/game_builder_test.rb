require 'test_helper'

class GameBuilderTest < ActiveSupport::TestCase
  def setup
    @season = seasons(:fourteen)
    @team1 = teams(:pens)
    @team2 = teams(:caps)
  end

  test "should return a game that has a season" do
    data = GameBuilder.new(year_start: 2014)
    game = data.to_game
    assert_equal @season, game.season
  end

  test "should return a game that has a season if given a string" do
    data = GameBuilder.new(year_start: "2014")
    game = data.to_game
    assert_equal @season, game.season
  end

  test "should return a game that has an away team when given an abbreviation" do
    data = GameBuilder.new(away_team: @team1.abbreviation)
    game = data.to_game
    assert_equal @team1, game.away_team
  end

  test "should return a game that has a home team when given an abbreviation" do
    data = GameBuilder.new(home_team: @team2.abbreviation)
    game = data.to_game
    assert_equal @team2, game.home_team
  end

  test "should return a game that has an away team when given a name" do
    data = GameBuilder.new(away_team: @team1.name)
    game = data.to_game
    assert_equal @team1, game.away_team
  end

  test "should return a game that has a home team when given an name" do
    data = GameBuilder.new(home_team: @team2.name)
    game = data.to_game
    assert_equal @team2, game.home_team
  end

  test "should return a game that has a game number" do
    data = GameBuilder.new(game_number: 2014020709)
    game = data.to_game
    assert_equal 2014020709, game.game_number
  end

  test "should return a game that has a game number if given a string" do
    data = GameBuilder.new(game_number: "2014020709")
    game = data.to_game
    assert_equal 2014020709, game.game_number
  end

  test "should return a game that has a date" do
    data = GameBuilder.new(date: Date.new(2015, 1, 28))
    game = data.to_game
    assert_equal Date.new(2015, 1, 28), game.date
  end

  test "should return a game that has a date when given a string" do
    data = GameBuilder.new(date: "Jan 28, 2015")
    game = data.to_game
    assert_equal Date.new(2015, 1, 28), game.date
  end

  test "should return a game that is a regular season game" do
    data = GameBuilder.new(is_playoffs: false)
    game = data.to_game
    refute game.playoffs?
  end

  test "should return a game that is a regular season game when given a string" do
    data = GameBuilder.new(is_playoffs: "false")
    game = data.to_game
    refute game.playoffs?
  end

  test "should return a game that is a playoff game" do
    data = GameBuilder.new(is_playoffs: true)
    game = data.to_game
    assert game.playoffs?
  end

  test "should return a game that is a playoff game when given a string" do
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
