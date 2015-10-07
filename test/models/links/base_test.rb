require 'test_helper'

class Links::BaseTest < ActiveSupport::TestCase

  test "::autoload_links should make all link objects available" do
    assert 0, Links::Season.constants.length
    assert 0, Links::Game.constants.length

    Links::Base.autoload_links

    assert Links::Season.constants.length > 0
    assert Links::Game.constants.length > 0
  end

  test "should be sortable by group, position" do
    link1 = Links::Base.new
    link2 = Links::Base.new
    link3 = Links::Base.new
    link4 = Links::Base.new

    def link1.group ; 1 ; end
    def link2.group ; 1 ; end
    def link3.group ; 0 ; end
    def link4.group ; 0 ; end

    def link1.position ; 1 ; end
    def link2.position ; 0 ; end
    def link3.position ; 1 ; end
    def link4.position ; 0 ; end

    subject = [link1, link2, link3, link4]
    expected = [link4, link3, link2, link1]

    assert_equal expected, subject.sort
  end

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
