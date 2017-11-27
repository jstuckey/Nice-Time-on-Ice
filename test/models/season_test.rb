require 'test_helper'

class SeasonTest < ActiveSupport::TestCase
  should have_many :games
  should have_many :season_teams
  should have_many :teams

  should validate_uniqueness_of :year_start
  should validate_uniqueness_of :year_end

  test "to_s should be a combination of year_start and year_end" do
    season = Season.new(year_start: 2014, year_end: 2015)
    assert_equal "20142015", season.to_s
  end
end
