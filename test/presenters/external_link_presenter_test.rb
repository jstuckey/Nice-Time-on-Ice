require 'test_helper'

class ExternalLinkPresenterTest < ActiveSupport::TestCase

  setup do
    @context = RequestContext.new(game: '2014021217',
                                  team: 'WSH',
                                  season: '2014',
                                  game_type: '2')
  end

  test "#links should return list of anchor tags for each season link" do
    expected = [
      %Q(<a class="link" target="new" href="http://nhl.com">Main Page</a>),
      %Q(<a class="link" target="new" href="http://nhl.com/stats">Stats</a>)
    ]

    assert_equal expected, ExternalLinkPresenter.new(@context, :test).links
  end

  test "#links should return empty list if no game" do
    context = RequestContext.new(team: 'WSH',
                                 season: '2013',
                                 game_type: '3')

    assert_equal [], ExternalLinkPresenter.new(context, :test).links
  end

  test "#headers should return list of <h4> tags for each site name" do
    expected = ["NHL.com", nil]
    assert_equal expected, ExternalLinkPresenter.new(@context, :test).headers
  end

  test "#headers should return empty list if no game" do
    context = RequestContext.new(team: 'WSH',
                                 season: '2013',
                                 game_type: '3')

    assert_equal [], ExternalLinkPresenter.new(context, :test).headers
  end

end

module Links::Test
  class FakeLink1 < Links::Base
    def site_name
      "NHL.com"
    end

    def description
      "Main Page"
    end

    def url
      "http://nhl.com"
    end

    def group
      0
    end

    def position
      0
    end
  end

  class FakeLink2 < Links::Base
    def site_name
      "NHL.com"
    end

    def description
      "Stats"
    end

    def url
      "http://nhl.com/stats"
    end

    def group
      0
    end

    def position
      1
    end
  end
end
