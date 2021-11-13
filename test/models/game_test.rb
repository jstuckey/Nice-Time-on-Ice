require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "should have custom #to_s method" do
    assert_equal "#<Game: 2014021201>", games(:game_one).to_s
  end
end
