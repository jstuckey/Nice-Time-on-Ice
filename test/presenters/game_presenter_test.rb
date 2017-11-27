require 'test_helper'

class GamePresenterTest < ActiveSupport::TestCase

  setup do
    @context = RequestContext.new(game: '2014021217',
                                  team: 'WSH',
                                  season: '2014',
                                  game_type: '2',
                                  game_order: 'desc')
  end

  test "#links should return list of anchor tags for each game in season" do
    expected = [%(<a class="game" href="/?game=2014021217&game_order=desc&game_type=2&season=2014&team=WSH">New York Rangers at</br>Washington Capitals</a>),
                %(<a class="game" href="/?game=2014021201&game_order=desc&game_type=2&season=2014&team=WSH">Boston Bruins at</br>Washington Capitals</a>)]

    # Not sure why href is html escaped
    expected = expected.map { |anchor| anchor.gsub("&", "&amp;") }

    assert_equal expected, GamePresenter.new(@context).links
  end

  test "#links should return ascending list of anchor tags if order passed in" do
    expected = [%(<a class="game" href="/?game=2014021201&game_order=asc&game_type=2&season=2014&team=WSH">Boston Bruins at</br>Washington Capitals</a>),
                %(<a class="game" href="/?game=2014021217&game_order=asc&game_type=2&season=2014&team=WSH">New York Rangers at</br>Washington Capitals</a>)]

    # Not sure why href is html escaped
    expected = expected.map { |anchor| anchor.gsub("&", "&amp;") }

    def @context.game_order ; "asc" ; end
    assert_equal expected, GamePresenter.new(@context).links
  end

  test "#dates should return list of game date strings for each game in season" do
    expected = ["Sat Apr 11, 2015", "Wed Apr 08, 2015"]
    assert_equal expected, GamePresenter.new(@context).dates
  end

  test "#dates should return ascending list of game date strings if order passed in" do
    expected = ["Wed Apr 08, 2015", "Sat Apr 11, 2015"]
    def @context.game_order ; "asc" ; end
    assert_equal expected, GamePresenter.new(@context).dates
  end

  test "#li_classes should return list of css clases for <li> tags" do
    expected = ["class=\"selected\"", ""]
    assert_equal expected, GamePresenter.new(@context).li_classes
  end

  test "#order_href should return ascending when order is descending" do
    expected = "/?game_order=asc&game_type=2&season=2014&team=WSH"
    assert_equal expected, GamePresenter.new(@context).order_href
  end

  test "#order_href should return descending when order is ascending" do
    expected = "/?game_order=desc&game_type=2&season=2014&team=WSH"
    def @context.game_order ; "asc" ; end
    assert_equal expected, GamePresenter.new(@context).order_href
  end

  test "#order_class should be glyph-down when order is descending" do
    assert_equal "glyph-down", GamePresenter.new(@context).order_class
  end

  test "#order_class should be glyph-up when order is ascending" do
    def @context.game_order ; "asc" ; end
    assert_equal "glyph-up", GamePresenter.new(@context).order_class
  end

end
