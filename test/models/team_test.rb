require 'test_helper'

class TeamTest < ActiveSupport::TestCase

  should have_many :season_teams
  should have_many :seasons

  should validate_uniqueness_of :name
  should validate_uniqueness_of :abbreviation

  test "Team#games should return combination of home and away games" do
    team = teams(:caps)
    game1 = Game.create(away_team: team, date: 2.days.ago, game_number: 123)
    game2 = Game.create(home_team: team, date: 1.day.ago, game_number: 456)

    assert_equal [game1, game2], team.games
  end

  test "Team#games should order games by date" do
    team = teams(:caps)
    game1 = Game.create(away_team: team, date: 2.days.ago, game_number: 123)
    game2 = Game.create(home_team: team, date: 3.day.ago, game_number: 456)

    assert_equal [game2, game1], team.games
  end
end
