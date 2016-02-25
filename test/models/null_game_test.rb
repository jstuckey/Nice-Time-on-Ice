require 'test_helper'

class NullGameHelper < ActiveSupport::TestCase
  test "should respond to id" do
    assert_respond_to NullGame.new, :id
  end

  test "should respond to game_number" do
    assert_respond_to NullGame.new, :game_number
  end

  test "should respond to date" do
    assert_respond_to NullGame.new, :date
  end

  test "should respond to playoffs" do
    assert_respond_to NullGame.new, :playoffs
  end

  test "should respond to season" do
    assert_respond_to NullGame.new, :season
  end

  test "should respond to away_team" do
    assert_respond_to NullGame.new, :away_team
  end

  test "should respond to home_team" do
    assert_respond_to NullGame.new, :home_team
  end

  test "should respond to created_at" do
    assert_respond_to NullGame.new, :created_at
  end

  test "should respond to updated_at" do
    assert_respond_to NullGame.new, :updated_at
  end

  test "should not respond to arbitrary method" do
    assert_not_respond_to NullGame.new, :soup
  end

  test "should respond to chained method calls" do
    NullGame.new.game_number.foo.bar.biz.baz
  end

  test "should return empty string from #to_s" do
    assert_equal "", NullGame.new.game_number.to_s
  end
end
