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
    expected = [%Q(<a class="game" href="/?game=2014021217&game_type=2&season=2014&team=WSH">New York Rangers at</br>Washington Capitals</a>),
                %Q(<a class="game" href="/?game=2014021201&game_type=2&season=2014&team=WSH">Boston Bruins at</br>Washington Capitals</a>)]

    # Not sure why href is html escaped
    expected = expected.map { |anchor| anchor.gsub("&", "&amp;") }

    assert_equal expected, GamePresenter.new(@context).links
  end

  test "#links should return ascending list of anchor tags if order passed in" do
    expected = [%Q(<a class="game" href="/?game=2014021201&game_type=2&season=2014&team=WSH">Boston Bruins at</br>Washington Capitals</a>),
                %Q(<a class="game" href="/?game=2014021217&game_type=2&season=2014&team=WSH">New York Rangers at</br>Washington Capitals</a>)]

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

end
