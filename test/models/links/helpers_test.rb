require 'test_helper'

class Links::HelpersTest < ActiveSupport::TestCase

  include Links::Helpers

  attr_accessor :team, :season, :game, :game_type

  test "#ha_team_number should return 1 for Anaheim" do
    self.team = teams(:ducks)
    assert_equal 1, ha_team_number
  end

  test "#ha_team_number should return 23 for Arizona" do
    self.team = teams(:yotes)
    assert_equal 23, ha_team_number
  end

  test "#ha_team_number should return 3 for Boston" do
    self.team = teams(:bruins)
    assert_equal 3, ha_team_number
  end

  test "#ha_team_number should return 4 for Buffalo" do
    self.team = teams(:sabres)
    assert_equal 4, ha_team_number
  end

  test "#ha_team_number should return 5 for Carolina" do
    self.team = teams(:canes)
    assert_equal 5, ha_team_number
  end

  test "#ha_team_number should return 6 for Calgary" do
    self.team = teams(:flames)
    assert_equal 6, ha_team_number
  end

  test "#ha_team_number should return 7 for Chicago" do
    self.team = teams(:blackhawks)
    assert_equal 7, ha_team_number
  end

  test "#ha_team_number should return 9 for Colorado" do
    self.team = teams(:avalanche)
    assert_equal 9, ha_team_number
  end

  test "#ha_team_number should return 8 for Columbus" do
    self.team = teams(:jackets)
    assert_equal 8, ha_team_number
  end

  test "#ha_team_number should return 10 for Dallas" do
    self.team = teams(:stars)
    assert_equal 10, ha_team_number
  end

  test "#ha_team_number should return 11 for Detroit" do
    self.team = teams(:wings)
    assert_equal 11, ha_team_number
  end

  test "#ha_team_number should return 12 for Edmonton" do
    self.team = teams(:oilers)
    assert_equal 12, ha_team_number
  end

  test "#ha_team_number should return 13 for Florida" do
    self.team = teams(:cats)
    assert_equal 13, ha_team_number
  end

  test "#ha_team_number should return 14 for Los Angeles" do
    self.team = teams(:kings)
    assert_equal 14, ha_team_number
  end

  test "#ha_team_number should return 15 for Minnesota" do
    self.team = teams(:wild)
    assert_equal 15, ha_team_number
  end

  test "#ha_team_number should return 16 for Montreal" do
    self.team = teams(:habs)
    assert_equal 16, ha_team_number
  end

  test "#ha_team_number should return 17 for Nashville" do
    self.team = teams(:preds)
    assert_equal 17, ha_team_number
  end

  test "#ha_team_number should return 18 for New Jersey" do
    self.team = teams(:devils)
    assert_equal 18, ha_team_number
  end

  test "#ha_team_number should return 19 for NY Islanders" do
    self.team = teams(:islanders)
    assert_equal 19, ha_team_number
  end

  test "#ha_team_number should return 20 for NY Rangers" do
    self.team = teams(:rags)
    assert_equal 20, ha_team_number
  end

  test "#ha_team_number should return 21 for Ottawa" do
    self.team = teams(:sens)
    assert_equal 21, ha_team_number
  end

  test "#ha_team_number should return 22 for Philadelphia" do
    self.team = teams(:flyers)
    assert_equal 22, ha_team_number
  end

  test "#ha_team_number should return 24 for Pittsburgh" do
    self.team = teams(:pens)
    assert_equal 24, ha_team_number
  end

  test "#ha_team_number should return 25 for San Jose" do
    self.team = teams(:sharks)
    assert_equal 25, ha_team_number
  end

  test "#ha_team_number should return 26 for St. Louis" do
    self.team = teams(:blues)
    assert_equal 26, ha_team_number
  end

  test "#ha_team_number should return 27 for Tampa Bay" do
    self.team = teams(:bolts)
    assert_equal 27, ha_team_number
  end

  test "#ha_team_number should return 28 for Toronto" do
    self.team = teams(:leafs)
    assert_equal 28, ha_team_number
  end

  test "#ha_team_number should return 29 for Vancouver" do
    self.team = teams(:canucks)
    assert_equal 29, ha_team_number
  end

  test "#ha_team_number should return 30 for Washington" do
    self.team = teams(:caps)
    assert_equal 30, ha_team_number
  end

  test "#ha_team_number should return 2 for Winnipeg" do
    self.team = teams(:jets)
    assert_equal 2, ha_team_number
  end

  test "#alternate_team_abbreviation handles Kings" do
    self.team = teams(:kings)
    assert_equal "L.A", alternate_team_abbreviation
  end

  test "#alternate_team_abbreviation handles Devils" do
    self.team = teams(:devils)
    assert_equal "N.J", alternate_team_abbreviation
  end

  test "#alternate_team_abbreviation handles Sharks" do
    self.team = teams(:sharks)
    assert_equal "S.J", alternate_team_abbreviation
  end

  test "#alternate_team_abbreviation handles Lighting" do
    self.team = teams(:bolts)
    assert_equal "T.B", alternate_team_abbreviation
  end

  test "#alternate_team_abbreviation handles other team" do
    self.team = teams(:leafs)
    assert_equal "TOR", alternate_team_abbreviation
  end

  test "#alternate_game_type should return 'p' for playoff game" do
    self.game_type = 3
    assert_equal 'p', alternate_game_type
  end

  test "#alternate_game_type should return 's' for regular game" do
    self.game_type = 2
    assert_equal 's', alternate_game_type
  end

  test "#team_in_playoffs? should return true if team made playoffs for a season" do
    self.team = teams(:caps)
    self.season = Season.create()

    game = Game.create(playoffs: true, home_team: team)
    season.games << game

    assert team_in_playoffs?
  end

  test "#team_in_playoffs? should return false if team missed playoffs for a season" do
    self.team = teams(:flyers)
    self.season = Season.create()

    game = Game.create(playoffs: false, home_team: team)
    season.games << game

    refute team_in_playoffs?
  end

  test "#game_number_without_year should strip year off the front of the game number" do
    self.game = Game.create(game_number: 2014021217)
    assert_equal "021217", game_number_without_year
  end

  test "#game_number_without_year_and_zero should strip year and 0 off the front of the game number" do
    self.game = Game.create(game_number: 2014021217)
    assert_equal "21217", game_number_without_year_and_zero
  end

  test "#full_team_name should return city and team name separated by hyphens" do
    self.team = teams(:jackets)
    assert_equal "columbus-blue-jackets", full_team_name
    self.team = teams(:islanders)
    assert_equal "new-york-islanders", full_team_name
  end

  test "#team_nickname should return name without the city" do
    self.team = teams(:caps)
    assert_equal "capitals", team_nickname
  end

  test "#team_nickname should return name for bluejackets" do
    self.team = teams(:jackets)
    assert_equal "bluejackets", team_nickname
  end

end
