require 'test_helper'

class GameTest < ActiveSupport::TestCase

  should belong_to :season
  should belong_to :away_team
  should belong_to :home_team

  should validate_uniqueness_of :game_number

end
