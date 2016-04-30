require 'test_helper'

class FalseyTest < ActiveSupport::TestCase

  test "should return empty string from  to_s" do
    object = Object.new
    object.extend(Falsey)
    assert_equal "", object.to_s
  end

  test "should return false from  present?" do
    object = Object.new
    object.extend(Falsey)
    assert_equal false, object.present?
  end

  test "should return true from  empty?" do
    object = Object.new
    object.extend(Falsey)
    assert_equal true, object.empty?
  end

  test "should return true from  blank?" do
    object = Object.new
    object.extend(Falsey)
    assert_equal true, object.blank?
  end
end
