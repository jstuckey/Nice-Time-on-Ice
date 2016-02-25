require 'test_helper'

class RequestContextTest < ActiveSupport::TestCase

  test "should convert a team id to a team object" do
    team = teams(:caps)
    context = RequestContext.new(team: team.id)
    assert_equal team, context.team
  end

  test "should convert a team abbreviation to a team object" do
    team = teams(:caps)
    context = RequestContext.new(team: team.abbreviation)
    assert_equal team, context.team
  end

  test "should convert a team object to a team object" do
    team = teams(:caps)
    context = RequestContext.new(team: team)
    assert_equal team, context.team
  end

  test "should return a null object if team did not make playoffs" do
    team = teams(:caps)
    season = seasons(:thirteen)
    game_type = "playoffs"

    context = RequestContext.new(team: team, season: season, game_type: game_type)
    assert_not_nil context.game
    assert_kind_of NullGame, context.game
  end

  test "should default to the Caps' team object" do
    team = teams(:caps)
    context = RequestContext.new
    assert_equal team, context.team
  end

  test "should convert a season id to a season object" do
    season = seasons(:fourteen)
    context = RequestContext.new(season: season.id)
    assert_equal season, context.season
  end

  test "should convert a year to a season object" do
    season = seasons(:fourteen)
    context = RequestContext.new(season: season.year_start)
    assert_equal season, context.season
  end

  test "should convert a year number to a season object" do
    season = seasons(:fourteen)
    context = RequestContext.new(season: 20142015)
    assert_equal season, context.season
  end

  test "should convert a year string to a season object" do
    season = seasons(:fourteen)
    context = RequestContext.new(season: "20142015")
    assert_equal season, context.season
  end

  test "should convert a season object to a season object" do
    season = seasons(:fourteen)
    context = RequestContext.new(season: season)
    assert_equal season, context.season
  end

  test "should default to the most recent season object" do
    season = seasons(:fourteen)
    context = RequestContext.new
    assert_equal season, context.season
  end

  test "should convert a game type as a number" do
    context = RequestContext.new(game_type: 2)
    assert_equal 2, context.game_type

    context = RequestContext.new(game_type: 3)
    assert_equal 3, context.game_type
  end

  test "should convert a game type as a string" do
    context = RequestContext.new(game_type: "regular")
    assert_equal 2, context.game_type

    context = RequestContext.new(game_type: "playoffs")
    assert_equal 3, context.game_type
  end

  test "should convert a game type as a capitalized string" do
    context = RequestContext.new(game_type: "Regular")
    assert_equal 2, context.game_type

    context = RequestContext.new(game_type: "Playoffs")
    assert_equal 3, context.game_type
  end

  test "should default to the regular season game type" do
    context = RequestContext.new
    assert_equal 2, context.game_type
  end

  test "should convert a game id to a game object" do
    game = games(:game_one)
    context = RequestContext.new(game: game.id)
    assert_equal game, context.game
  end

  test "should convert a game number to a game object" do
    game = games(:game_one)
    context = RequestContext.new(game: game.game_number)
    assert_equal game, context.game
  end

  test "should convert a game object to a game object" do
    game = games(:game_one)
    context = RequestContext.new(game: game)
    assert_equal game, context.game
  end

  test "should default to the most recent game for team in a season" do
    team = teams(:caps)
    season = seasons(:fourteen)
    game_type = "regular"
    game = games(:game_two)

    context = RequestContext.new(team: team, season: season, game_type: game_type)
    assert_equal game, context.game
  end

  test "should default to the most recent game for team in a season's playoffs" do
    team = teams(:caps)
    season = seasons(:fourteen)
    game_type = "playoffs"
    game = games(:game_three)

    context = RequestContext.new(team: team, season: season, game_type: game_type)
    assert_equal game, context.game
  end

  test "should default to the Caps' most recent regular season game" do
    game = games(:game_two)
    context = RequestContext.new
    assert_equal game, context.game
  end

  test "should set game_order to 'asc' if 'asc' is passed in" do
    context = RequestContext.new(game_order: "asc")
    assert_equal "asc", context.game_order
  end

  test "should set game_order to 'desc' if bad data is passed in" do
    context = RequestContext.new(game_order: "soup")
    assert_equal "desc", context.game_order
  end

  test "should set game_order to 'desc' by default" do
    context = RequestContext.new
    assert_equal "desc", context.game_order
  end

  test "should default to the oldest game for team in a season if game_order is ascending" do
    team = teams(:caps)
    season = seasons(:fourteen)
    game_type = "regular"
    game_order = "asc"
    game = games(:game_one)

    context = RequestContext.new(game_order: game_order, team: team, season: season, game_type: game_type)
    assert_equal game, context.game
  end

end
