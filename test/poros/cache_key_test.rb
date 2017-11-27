require 'test_helper'

class CacheKeyTest < ActiveSupport::TestCase

  test "should combine team, season, game, game type, game order, and today's date to form a cache key" do
    context = RequestContextDouble.new
    date = Date.new(2016, 5, 15)
    cache_key = CacheKey.new(context, date)
    expected = "wsh_2015_2015030133_3_desc_2016_05_15"
    assert_equal expected, cache_key.value
  end

  class RequestContextDouble
    def team
      self
    end

    def abbreviation
      "WSH"
    end

    def season
      self
    end

    def year_start
      2015
    end

    def game
      self
    end

    def game_number
      2015030133
    end

    def game_type
      3
    end

    def game_order
      "desc"
    end
  end
  private_constant :RequestContextDouble

end
