require 'test_helper'

class SeasonPresenterTest < ActiveSupport::TestCase

  setup do
    @context = RequestContext.new(team: 'WSH',
                                  season: '2013',
                                  game_type: '2')
  end

  test "#links should return list of anchor tags for each season and postseason" do
    expected = [
      %Q(<a class="season" href="/?game_order=desc&game_type=2&season=2014&team=WSH">2014 - 2015</a>),
      %Q(<a class="season" href="/?game_order=desc&game_type=3&season=2014&team=WSH">2014 - 2015 Playoffs</a>),
      %Q(<a class="season" href="/?game_order=desc&game_type=2&season=2013&team=WSH">2013 - 2014</a>),
      %Q(<a class="season" href="/?game_order=desc&game_type=3&season=2013&team=WSH">2013 - 2014 Playoffs</a>)]

    # Not sure why href is html escaped
    expected = expected.map { |anchor| anchor.gsub("&", "&amp;") }

    assert_equal expected, SeasonPresenter.new(@context).links
  end

  test "#li_classes should return list of css clases for <li> tags" do
    expected = ["", "", "class=\"selected\"", ""]
    assert_equal expected, SeasonPresenter.new(@context).li_classes
  end

end
