require 'test_helper'

class SeasonTest < ActiveSupport::TestCase
  test "to_s should be a combination of year_start and year_end" do
    season = Season.new(year_start: 2014, year_end: 2015)
    assert_equal "20142015", season.to_s
  end
end
