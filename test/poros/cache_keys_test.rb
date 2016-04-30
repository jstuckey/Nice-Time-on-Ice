require 'test_helper'

class CacheKeysTest < ActiveSupport::TestCase

  test "season_key should combine the selected season with date before July 1" do
    cache_keys = CacheKeys.new(*args)
    expected = "season_2014_2015_h1"
    assert_equal expected, cache_keys.season_key
  end

  test "season_key should combine the selected season with the date after July 1" do
    cache_keys = CacheKeys.new(*args_after_july)
    expected = "season_2014_2015_h2"
    assert_equal expected, cache_keys.season_key
  end

  test "team_key should combine the selected team with the date before July 1" do
    cache_keys = CacheKeys.new(*args)
    expected = "team_wsh_2015_h1"
    assert_equal expected, cache_keys.team_key
  end

  test "team_key should combine the selected team with the date after July 1" do
    cache_keys = CacheKeys.new(*args_after_july)
    expected = "team_wsh_2015_h2"
    assert_equal expected, cache_keys.team_key
  end

  test "game_key should combine all fields and the date" do
    cache_keys = CacheKeys.new(*args)
    expected = "game_wsh_2014_2014021201_2_asc_2015_05_15"
    assert_equal expected, cache_keys.game_key
  end

  test "external_season_link_key should combine all fields and the date except for game_order" do
    cache_keys = CacheKeys.new(*args)
    expected = "external_season_link_wsh_2014_2014021201_2_2015_05_15"
    assert_equal expected, cache_keys.external_season_link_key
  end

  test "external_game_link_key should combine all fields and the date except for game_order" do
    cache_keys = CacheKeys.new(*args)
    expected = "external_game_link_wsh_2014_2014021201_2_2015_05_15"
    assert_equal expected, cache_keys.external_game_link_key
  end

  test "external_misc_link_key should combine all fields and the date except for game_order" do
    cache_keys = CacheKeys.new(*args)
    expected = "external_misc_link_wsh_2014_2014021201_2_2015_05_15"
    assert_equal expected, cache_keys.external_misc_link_key
  end

  private

  def args
    [FakeContext.new, Date.new(2015, 5, 15)]
  end

  def args_after_july
    [FakeContext.new, Date.new(2015, 7, 1)]
  end


  class FakeContext
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
      2014
    end

    def game
      self
    end

    def game_number
      2014021201
    end

    def game_type
      2
    end

    def game_order
      "asc"
    end
  end
  private_constant :FakeContext

end
