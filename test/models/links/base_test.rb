require 'test_helper'

class Links::BaseTest < ActiveSupport::TestCase
  test "it doesn't blow up" do
    Links::Base.new
  end

  test "::new should accept a team id" do
    team = teams(:caps)
    link = Links::Base.new(team: team.id)
    assert_equal team, link.team
  end

  test "::new should accept a team object" do
    team = teams(:caps)
    link = Links::Base.new(team: team)
    assert_equal team, link.team
  end

  test "::new should accept a team abbreviation" do
    team = teams(:caps)
    link = Links::Base.new(team: team.abbreviation)
    assert_equal team, link.team
  end

  test "::new should accept a season id" do
    season = seasons(:fourteen)
    link = Links::Base.new(season: season.id)
    assert_equal season, link.season
  end

  test "::new should accept a season object" do
    season = seasons(:fourteen)
    link = Links::Base.new(season: season)
    assert_equal season, link.season
  end

  test "::new should accept a season year start" do
    season = seasons(:fourteen)
    link = Links::Base.new(season: season.year_start)
    assert_equal season, link.season
  end

  test "::new should use the most recent season by default" do
    season = Season.last
    link = Links::Base.new
    assert_equal season, link.season
  end

  test "::new should accept a game id" do
    game = games(:game_one)
    link = Links::Base.new(game: game.id)
    assert_equal game, link.game
  end

  test "::new should accept a game object" do
    game = games(:game_one)
    link = Links::Base.new(game: game)
    assert_equal game, link.game
  end

  test "::new should accept a game number" do
    game = games(:game_one)
    link = Links::Base.new(game: game.game_number)
    assert_equal game, link.game
  end

  test "::new should accept a game type as a number" do
    link = Links::Base.new(game_type: 2)
    assert_equal 2, link.game_type

    link = Links::Base.new(game_type: 3)
    assert_equal 3, link.game_type
  end

  test "::new should accept a game type as a string" do
    link = Links::Base.new(game_type: "regular")
    assert_equal 2, link.game_type

    link = Links::Base.new(game_type: "playoffs")
    assert_equal 3, link.game_type
  end

  test "::new should use regular season game type by default" do
    link = Links::Base.new
    assert_equal 2, link.game_type
  end

  test "#site_name should raise exception" do
    message = nil
    begin
      Links::Base.new.site_name
    rescue => ex
      message = ex.message
    end

    assert_equal "Override #site_name method in subclass", message
  end

  test "#description should raise exception" do
    message = nil
    begin
      Links::Base.new.description
    rescue => ex
      message = ex.message
    end

    assert_equal "Override #description method in subclass", message
  end

  test "#url should raise exception" do
    message = nil
    begin
      Links::Base.new.url
    rescue => ex
      message = ex.message
    end

    assert_equal "Override #url method in subclass", message
  end

  test "#group should raise exception" do
    message = nil
    begin
      Links::Base.new.group
    rescue => ex
      message = ex.message
    end

    assert_equal "Override #group method in subclass", message
  end

  test "#position should raise exception" do
    message = nil
    begin
      Links::Base.new.position
    rescue => ex
      message = ex.message
    end

    assert_equal "Override #position method in subclass", message
  end

end
