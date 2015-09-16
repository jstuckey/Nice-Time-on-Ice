require 'test_helper'

class Links::BaseTest < ActiveSupport::TestCase

  test "#site_name should raise exception" do
    message = nil
    begin
      Links::Base.new.site_name
    rescue => ex
      message = ex.message
    end

    assert_equal "Override #site_name method in subclass", message
  end

  test "#description should raise exception" do
    message = nil
    begin
      Links::Base.new.description
    rescue => ex
      message = ex.message
    end

    assert_equal "Override #description method in subclass", message
  end

  test "#url should raise exception" do
    message = nil
    begin
      Links::Base.new.url
    rescue => ex
      message = ex.message
    end

    assert_equal "Override #url method in subclass", message
  end

  test "#group should raise exception" do
    message = nil
    begin
      Links::Base.new.group
    rescue => ex
      message = ex.message
    end

    assert_equal "Override #group method in subclass", message
  end

  test "#position should raise exception" do
    message = nil
    begin
      Links::Base.new.position
    rescue => ex
      message = ex.message
    end

    assert_equal "Override #position method in subclass", message
  end

end
