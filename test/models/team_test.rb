require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  should have_many :season_teams
  should have_many :seasons

  should validate_uniqueness_of :name
  should validate_uniqueness_of :abbreviation
end
