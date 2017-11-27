require 'test_helper'

class GameTest < ActiveSupport::TestCase

  should belong_to :season
  should belong_to :away_team
  should belong_to :home_team

  should validate_uniqueness_of :game_number

  should validate_presence_of :game_number
  should validate_presence_of :date
  should validate_presence_of :season_id
  should validate_presence_of :away_team_id
  should validate_presence_of :home_team_id

  test "should have custom #to_s method" do
    assert_equal "#<Game: 2014021201>", games(:game_one).to_s
  end

end
