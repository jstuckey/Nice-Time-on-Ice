require 'test_helper'

class ApiControllerTest < ActionController::TestCase

  test "index should return html page" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "index should set documentation_hash" do
    get :index
    assert_response :success
    documentation = assigns(:documentation)
    assert documentation

    doc_hash = documentation.values.first
    assert doc_hash.has_key?(:path)
    assert doc_hash.has_key?(:description)
    assert doc_hash.has_key?(:inputs)
    assert doc_hash.has_key?(:input_descriptions)
  end

  test "should get api/seasons" do
    get :seasons
    assert_response :success

    expected = [{"seasonID" => "20132014"},
                {"seasonID" => "20142015"}]
    body = JSON.parse(response.body)
    assert_equal expected, body
  end

  test "should get api/seasons/:season" do
    get :season, season: 20142015
    assert_response :success

    expected = {"seasonID" => "20142015"}
    body = JSON.parse(response.body)
    assert_equal expected, body
  end

  test "should get api/seasons/:season/games" do
    get :season_games, season: 20142015
    assert_response :success

    expected = [
      {"gameID"   => "2014021201",
       "date"     => "Wed Apr 08, 2015",
       "awayTeam" => "Boston Bruins",
       "homeTeam" => "Washington Capitals",
       "gameType" => "Regular"},
      {"gameID"   => "2014021217",
       "date"     => "Sat Apr 11, 2015",
       "awayTeam" => "New York Rangers",
       "homeTeam" => "Washington Capitals",
       "gameType" => "Regular"},
      {"gameID"   => "2014030141",
       "date"     => "Wed Apr 15, 2015",
       "awayTeam" => "New York Islanders",
       "homeTeam" => "Washington Capitals",
       "gameType" => "Playoffs"}
    ]

    body = JSON.parse(response.body)
    assert_equal expected, body
  end

  test "should get api/seasons/:season/games/:game" do
    get :season_game, season: 20142015, game: 2014021201
    assert_response :success

    expected = {
      "gameID"   => "2014021201",
      "date"     => "Wed Apr 08, 2015",
      "awayTeam" => "Boston Bruins",
      "homeTeam" => "Washington Capitals",
      "gameType" => "Regular"
    }

    body = JSON.parse(response.body)
    assert_equal expected, body
  end

  test "should get api/seasons/:season/games/:game/links" do
    get :season_game_links, season: 20142015, game: 2014021201
    assert_response :success
  end

  test "should get api/teams" do
    Team.destroy_all
    Team.create(name: "Caps", abbreviation: "WSH")

    get :teams
    assert_response :success

    expected = [{"name" => "Caps", "teamID" => "WSH"}]
    body = JSON.parse(response.body)
    assert_equal expected, body
  end

  test "should get api/teams/:id" do
    Team.destroy_all
    Team.create(name: "Caps", abbreviation: "WSH")

    get :team, team: "WSH"
    assert_response :success

    expected = {"name" => "Caps", "teamID" => "WSH"}
    body = JSON.parse(response.body)
    assert_equal expected, body
  end

  test "should get api/teams/:team/seasons" do
    get :team_seasons, team: "WSH"
    assert_response :success

    expected = [{"seasonID" => "20132014"}, {"seasonID" => "20142015"}]
    body = JSON.parse(response.body)
    assert_equal expected, body
  end

  test "should get api/teams/:team/seasons/:season" do
    get :team_season, team: "WSH", season: 20142015
    assert_response :success

    expected = {"seasonID" => "20142015"}
    body = JSON.parse(response.body)
    assert_equal expected, body
  end

  test "should get api/teams/:id/seasons/:id/links" do
    get :team_season_links, team: "WSH", season: 20142015
    assert_response :success
  end

  test "should get api/games" do
    get :games
    assert_response :success

    expected = [
      {"gameID"   => "2014021201",
       "date"     => "Wed Apr 08, 2015",
       "awayTeam" => "Boston Bruins",
       "homeTeam" => "Washington Capitals",
       "gameType" => "Regular"},
      {"gameID"   => "2014021217",
       "date"     => "Sat Apr 11, 2015",
       "awayTeam" => "New York Rangers",
       "homeTeam" => "Washington Capitals",
       "gameType" => "Regular"},
      {"gameID"   => "2014030141",
       "date"     => "Wed Apr 15, 2015",
       "awayTeam" => "New York Islanders",
       "homeTeam" => "Washington Capitals",
       "gameType" => "Playoffs"}
    ]

    body = JSON.parse(response.body)
    assert_equal expected, body
  end

  test "should get api/games/:game" do
    get :game, game: 2014021201
    assert_response :success

    expected = {
      "gameID"   => "2014021201",
      "date"     => "Wed Apr 08, 2015",
      "awayTeam" => "Boston Bruins",
      "homeTeam" => "Washington Capitals",
      "gameType" => "Regular"
    }

    body = JSON.parse(response.body)
    assert_equal expected, body
  end

end
