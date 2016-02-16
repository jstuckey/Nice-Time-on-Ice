require 'test_helper'

class AliasAttributeTest < ActiveSupport::TestCase

  attr_accessor :foo

  test "should respond to new attribute" do
    refute self.respond_to?(:bar)
    refute self.respond_to?(:bar=)

    self.class_eval do
      include AliasAttribute
      alias_attribute :bar, :foo
    end

    assert self.respond_to?(:bar)
    assert self.respond_to?(:bar=)
  end

  test "should alias :foo= attribute to :bar attribute" do
    self.class_eval do
      include AliasAttribute
      alias_attribute :bar, :foo
    end

    self.foo = "return of foo"
    assert_equal "return of foo", self.bar
  end

  test "should alias :bar= attribute to :foo attribute" do
    self.class_eval do
      include AliasAttribute
      alias_attribute :bar, :foo
    end

    self.bar = "return of bar"
    assert_equal "return of bar", self.foo
  end
end
