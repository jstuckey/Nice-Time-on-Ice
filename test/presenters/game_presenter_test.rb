require 'test_helper'

class GamePresenterTest < ActiveSupport::TestCase

  setup do
    @context = RequestContext.new(game: '2014021217',
                                  team: 'WSH',
                                  season: '2014',
                                  game_type: '2')
  end

  test "#links should return list of anchor tags for each game in season" do
    expected = [%Q(<a class="game" href="/?game=2014021217&game_type=2&season=2014&team=WSH">New York Rangers at</br>Washington Capitals</a>)]

    # Not sure why href is html escaped
    expected = expected.map { |anchor| anchor.gsub("&", "&amp;") }

    assert_equal expected, GamePresenter.new(@context).links
  end

  test "#dates should return list of game date strings for each game in season" do
    expected = Array("Sat Apr 11, 2015")
    assert_equal expected, GamePresenter.new(@context).dates
  end

  test "#dates_and_links should return tuples of date and link" do
    link = %Q(<a class="game" href="/?game=2014021217&game_type=2&season=2014&team=WSH">New York Rangers at</br>Washington Capitals</a>)
    link = link.gsub("&", "&amp;")
    date = "Sat Apr 11, 2015"
    expected = [ [date, link] ]

    assert_equal expected, GamePresenter.new(@context).dates_and_links
  end

end
