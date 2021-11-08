require 'test_helper'

class SeasonTeamTest < ActiveSupport::TestCase
  test "should not allow duplicate id pairs" do
    team_id = "1"
    season_id = "2"
    SeasonTeam.create(season_id: season_id, team_id: team_id)
    duplicate = SeasonTeam.create(season_id: season_id, team_id: team_id)
    refute duplicate.save
  end
end
