require 'test_helper'

class AliasAttributeTest < ActiveSupport::TestCase
  attr_accessor :foo

  test "should respond to new attribute" do
    refute respond_to?(:bar)
    refute respond_to?(:bar=)

    class_eval do
      include AliasAttribute
      alias_attribute :bar, :foo
    end

    assert respond_to?(:bar)
    assert respond_to?(:bar=)
  end

  test "should alias :foo= attribute to :bar attribute" do
    class_eval do
      include AliasAttribute
      alias_attribute :bar, :foo
    end

    self.foo = "return of foo"
    assert_equal "return of foo", bar
  end

  test "should alias :bar= attribute to :foo attribute" do
    class_eval do
      include AliasAttribute
      alias_attribute :bar, :foo
    end

    self.bar = "return of bar"
    assert_equal "return of bar", foo
  end
end
