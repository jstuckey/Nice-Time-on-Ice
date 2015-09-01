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

  test "#alternate_team_abbreviation handles Kings" do
    team = Team.create(abbreviation: "LAK")
    abbrev = Links::Base.new(team: team).alternate_team_abbreviation
    assert_equal "L.A", abbrev
  end

  test "#alternate_team_abbreviation handles Devils" do
    team = Team.create(abbreviation: "NJD")
    abbrev = Links::Base.new(team: team).alternate_team_abbreviation
    assert_equal "N.J", abbrev
  end

  test "#alternate_team_abbreviation handles Sharks" do
    team = Team.create(abbreviation: "SJS")
    abbrev = Links::Base.new(team: team).alternate_team_abbreviation
    assert_equal "S.J", abbrev
  end

  test "#alternate_team_abbreviation handles Lighting" do
    team = Team.create(abbreviation: "TBL")
    abbrev = Links::Base.new(team: team).alternate_team_abbreviation
    assert_equal "T.B", abbrev
  end

  test "#alternate_team_abbreviation handles other team" do
    team = Team.create(abbreviation: "TOR")
    abbrev = Links::Base.new(team: team).alternate_team_abbreviation
    assert_equal "TOR", abbrev
  end

  test "#team_in_playoffs? should return true if team made playoffs for a season" do
    team = Team.create(name: "Blackhawks")
    season = Season.create()

    game = Game.create(playoffs: true, home_team: team)
    season.games << game

    assert Links::Base.new(team: team, season: season).team_in_playoffs?
  end

  test "#team_in_playoffs? should return false if team missed playoffs for a season" do
    team = Team.create(name: "Flyers")
    season = Season.create()

    game = Game.create(playoffs: false, home_team: team)
    season.games << game

    refute Links::Base.new(team: team, season: season).team_in_playoffs?
  end

  test "#ha_team_number should return 1 for Anaheim" do
    team = Team.create(abbreviation: "ANA")
    assert_equal 1, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 23 for Arizona" do
    team = Team.create(abbreviation: "ARI")
    assert_equal 23, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 3 for Boston" do
    team = Team.create(abbreviation: "BOS")
    assert_equal 3, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 4 for Buffalo" do
    team = Team.create(abbreviation: "BUF")
    assert_equal 4, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 5 for Carolina" do
    team = Team.create(abbreviation: "CAR")
    assert_equal 5, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 6 for Calgary" do
    team = Team.create(abbreviation: "CGY")
    assert_equal 6, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 7 for Chicago" do
    team = Team.create(abbreviation: "CHI")
    assert_equal 7, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 9 for Colorado" do
    team = Team.create(abbreviation: "COL")
    assert_equal 9, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 8 for Columbus" do
    team = Team.create(abbreviation: "CBJ")
    assert_equal 8, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 10 for Dallas" do
    team = Team.create(abbreviation: "DAL")
    assert_equal 10, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 11 for Detroit" do
    team = Team.create(abbreviation: "DET")
    assert_equal 11, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 12 for Edmonton" do
    team = Team.create(abbreviation: "EDM")
    assert_equal 12, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 13 for Florida" do
    team = Team.create(abbreviation: "FLA")
    assert_equal 13, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 14 for Los Angeles" do
    team = Team.create(abbreviation: "LAK")
    assert_equal 14, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 15 for Minnesota" do
    team = Team.create(abbreviation: "MIN")
    assert_equal 15, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 16 for Montreal" do
    team = Team.create(abbreviation: "MTL")
    assert_equal 16, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 17 for Nashville" do
    team = Team.create(abbreviation: "NSH")
    assert_equal 17, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 18 for New Jersey" do
    team = Team.create(abbreviation: "NJD")
    assert_equal 18, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 19 for NY Islanders" do
    team = teams(:islanders)
    assert_equal 19, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 20 for NY Rangers" do
    team = Team.create(abbreviation: "NYR")
    assert_equal 20, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 21 for Ottawa" do
    team = Team.create(abbreviation: "OTT")
    assert_equal 21, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 22 for Philadelphia" do
    team = Team.create(abbreviation: "PHI")
    assert_equal 22, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 24 for Pittsburgh" do
    team = teams(:pens)
    assert_equal 24, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 25 for San Jose" do
    team = Team.create(abbreviation: "SJS")
    assert_equal 25, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 26 for St. Louis" do
    team = Team.create(abbreviation: "STL")
    assert_equal 26, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 27 for Tampa Bay" do
    team = Team.create(abbreviation: "TBL")
    assert_equal 27, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 28 for Toronto" do
    team = Team.create(abbreviation: "TOR")
    assert_equal 28, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 29 for Vancouver" do
    team = Team.create(abbreviation: "VAN")
    assert_equal 29, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 30 for Washington" do
    team = teams(:caps)
    assert_equal 30, Links::Base.new(team: team).ha_team_number
  end

  test "#ha_team_number should return 2 for Winnipeg" do
    team = Team.create(abbreviation: "WPG")
    assert_equal 2, Links::Base.new(team: team).ha_team_number
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
