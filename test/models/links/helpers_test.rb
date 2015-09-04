require 'test_helper'

class Links::HelpersTest < ActiveSupport::TestCase

  include Links::Helpers

  attr_accessor :team, :season, :game, :game_type

  test "#ha_team_number should return 1 for Anaheim" do
    self.team = Team.create(abbreviation: "ANA")
    assert_equal 1, ha_team_number
  end

  test "#ha_team_number should return 23 for Arizona" do
    self.team = Team.create(abbreviation: "ARI")
    assert_equal 23, ha_team_number
  end

  test "#ha_team_number should return 3 for Boston" do
    self.team = Team.create(abbreviation: "BOS")
    assert_equal 3, ha_team_number
  end

  test "#ha_team_number should return 4 for Buffalo" do
    self.team = Team.create(abbreviation: "BUF")
    assert_equal 4, ha_team_number
  end

  test "#ha_team_number should return 5 for Carolina" do
    self.team = Team.create(abbreviation: "CAR")
    assert_equal 5, ha_team_number
  end

  test "#ha_team_number should return 6 for Calgary" do
    self.team = Team.create(abbreviation: "CGY")
    assert_equal 6, ha_team_number
  end

  test "#ha_team_number should return 7 for Chicago" do
    self.team = Team.create(abbreviation: "CHI")
    assert_equal 7, ha_team_number
  end

  test "#ha_team_number should return 9 for Colorado" do
    self.team = Team.create(abbreviation: "COL")
    assert_equal 9, ha_team_number
  end

  test "#ha_team_number should return 8 for Columbus" do
    self.team = Team.create(abbreviation: "CBJ")
    assert_equal 8, ha_team_number
  end

  test "#ha_team_number should return 10 for Dallas" do
    self.team = Team.create(abbreviation: "DAL")
    assert_equal 10, ha_team_number
  end

  test "#ha_team_number should return 11 for Detroit" do
    self.team = Team.create(abbreviation: "DET")
    assert_equal 11, ha_team_number
  end

  test "#ha_team_number should return 12 for Edmonton" do
    self.team = Team.create(abbreviation: "EDM")
    assert_equal 12, ha_team_number
  end

  test "#ha_team_number should return 13 for Florida" do
    self.team = Team.create(abbreviation: "FLA")
    assert_equal 13, ha_team_number
  end

  test "#ha_team_number should return 14 for Los Angeles" do
    self.team = Team.create(abbreviation: "LAK")
    assert_equal 14, ha_team_number
  end

  test "#ha_team_number should return 15 for Minnesota" do
    self.team = Team.create(abbreviation: "MIN")
    assert_equal 15, ha_team_number
  end

  test "#ha_team_number should return 16 for Montreal" do
    self.team = Team.create(abbreviation: "MTL")
    assert_equal 16, ha_team_number
  end

  test "#ha_team_number should return 17 for Nashville" do
    self.team = Team.create(abbreviation: "NSH")
    assert_equal 17, ha_team_number
  end

  test "#ha_team_number should return 18 for New Jersey" do
    self.team = Team.create(abbreviation: "NJD")
    assert_equal 18, ha_team_number
  end

  test "#ha_team_number should return 19 for NY Islanders" do
    self.team = teams(:islanders)
    assert_equal 19, ha_team_number
  end

  test "#ha_team_number should return 20 for NY Rangers" do
    self.team = Team.create(abbreviation: "NYR")
    assert_equal 20, ha_team_number
  end

  test "#ha_team_number should return 21 for Ottawa" do
    self.team = Team.create(abbreviation: "OTT")
    assert_equal 21, ha_team_number
  end

  test "#ha_team_number should return 22 for Philadelphia" do
    self.team = Team.create(abbreviation: "PHI")
    assert_equal 22, ha_team_number
  end

  test "#ha_team_number should return 24 for Pittsburgh" do
    self.team = teams(:pens)
    assert_equal 24, ha_team_number
  end

  test "#ha_team_number should return 25 for San Jose" do
    self.team = Team.create(abbreviation: "SJS")
    assert_equal 25, ha_team_number
  end

  test "#ha_team_number should return 26 for St. Louis" do
    self.team = Team.create(abbreviation: "STL")
    assert_equal 26, ha_team_number
  end

  test "#ha_team_number should return 27 for Tampa Bay" do
    self.team = Team.create(abbreviation: "TBL")
    assert_equal 27, ha_team_number
  end

  test "#ha_team_number should return 28 for Toronto" do
    self.team = Team.create(abbreviation: "TOR")
    assert_equal 28, ha_team_number
  end

  test "#ha_team_number should return 29 for Vancouver" do
    self.team = Team.create(abbreviation: "VAN")
    assert_equal 29, ha_team_number
  end

  test "#ha_team_number should return 30 for Washington" do
    self.team = teams(:caps)
    assert_equal 30, ha_team_number
  end

  test "#ha_team_number should return 2 for Winnipeg" do
    self.team = Team.create(abbreviation: "WPG")
    assert_equal 2, ha_team_number
  end

  test "#alternate_team_abbreviation handles Kings" do
    self.team = Team.create(abbreviation: "LAK")
    assert_equal "L.A", alternate_team_abbreviation
  end

  test "#alternate_team_abbreviation handles Devils" do
    self.team = Team.create(abbreviation: "NJD")
    assert_equal "N.J", alternate_team_abbreviation
  end

  test "#alternate_team_abbreviation handles Sharks" do
    self.team = Team.create(abbreviation: "SJS")
    assert_equal "S.J", alternate_team_abbreviation
  end

  test "#alternate_team_abbreviation handles Lighting" do
    self.team = Team.create(abbreviation: "TBL")
    assert_equal "T.B", alternate_team_abbreviation
  end

  test "#alternate_team_abbreviation handles other team" do
    self.team = Team.create(abbreviation: "TOR")
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
    self.team = Team.create(name: "Blackhawks")
    self.season = Season.create()

    game = Game.create(playoffs: true, home_team: team)
    season.games << game

    assert team_in_playoffs?
  end

  test "#team_in_playoffs? should return false if team missed playoffs for a season" do
    self.team = Team.create(name: "Flyers")
    self.season = Season.create()

    game = Game.create(playoffs: false, home_team: team)
    season.games << game

    refute team_in_playoffs?
  end

  test "#game_number_without_year should strip year off the front of the game number" do
    self.game = Game.create(game_number: 2014021217)
    assert_equal "021217", game_number_without_year
  end

end
