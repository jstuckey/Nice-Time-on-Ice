require 'test_helper'

class LinkHelpersTest < ActiveSupport::TestCase
  include LinkHelpers

  attr_accessor :team, :season, :game, :game_type

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

  test "#full_text_game_type should return 'Playoffs' for playoff game" do
    self.game_type = 3
    assert_equal "Playoffs", full_text_game_type
  end

  test "#full_text_game_type should return 'Regular' for regular game" do
    self.game_type = 2
    assert_equal "Regular", full_text_game_type
  end

  test "#game_number_without_year should strip year off the front of the game number" do
    self.game = Game.create(game_number: 2014021217)
    assert_equal "021217", game_number_without_year
  end

  test "#game_number_without_year_and_zero strips year and 0 off front of game number" do
    self.game = Game.create(game_number: 2014021217)
    assert_equal "21217", game_number_without_year_and_zero
  end

  test "#full_team_name should return city and team name separated by hyphens" do
    self.team = teams(:jackets)
    assert_equal "columbus-blue-jackets", full_team_name
    self.team = teams(:islanders)
    assert_equal "new-york-islanders", full_team_name
  end

  test "#full_team_name should remove periods" do
    self.team = teams(:blues)
    assert_equal "st-louis-blues", full_team_name
  end

  test "#nhl_numbers_team_abbreviation should return CLB for Columbus" do
    self.team = teams(:jackets)
    assert_equal "CLB", nhl_numbers_team_abbreviation
  end

  test "#nhl_numbers_team_abbreviation should return NAS for Nashville" do
    self.team = teams(:preds)
    assert_equal "NAS", nhl_numbers_team_abbreviation
  end

  test "#nhl_numbers_team_abbreviation should return WAS for Washington" do
    self.team = teams(:caps)
    assert_equal "WAS", nhl_numbers_team_abbreviation
  end

  test "#nhl_numbers_team_abbreviation should return regular abbreviation otherwise" do
    self.team = teams(:devils)
    assert_equal "NJD", nhl_numbers_team_abbreviation
  end
end
