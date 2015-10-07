require 'test_helper'

class TeamPresenterTest < ActiveSupport::TestCase

  setup do
    @context = RequestContext.new(team: 'WSH',
                                  season: '2014',
                                  game_type: '2')
  end

  test "#links should return list of anchor tags for each team" do
    expected = [
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=ANA">Anaheim Ducks</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=ARI">Arizona Coyotes</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=BOS">Boston Bruins</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=BUF">Buffalo Sabres</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=CGY">Calgary Flames</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=CAR">Carolina Hurricanes</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=CHI">Chicago Blackhawks</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=COL">Colorado Avalanche</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=CBJ">Columbus Blue Jackets</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=DAL">Dallas Stars</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=DET">Detroit Red Wings</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=EDM">Edmonton Oilers</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=FLA">Florida Panthers</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=LAK">Los Angeles Kings</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=MIN">Minnesota Wild</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=MTL">Montreal Canadiens</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=NSH">Nashville Predators</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=NJD">New Jersey Devils</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=NYI">New York Islanders</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=NYR">New York Rangers</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=OTT">Ottawa Senators</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=PHI">Philadelphia Flyers</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=PIT">Pittsburgh Penguins</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=SJS">San Jose Sharks</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=STL">St. Louis Blues</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=TBL">Tampa Bay Lightning</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=TOR">Toronto Maple Leafs</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=VAN">Vancouver Canucks</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=WSH">Washington Capitals</a>),
      %Q(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=WPG">Winnipeg Jets</a>)]

    # Not sure why href is html escaped
    expected = expected.map { |anchor| anchor.gsub("&", "&amp;") }

    assert_equal expected, TeamPresenter.new(@context).links
  end

  test "#li_classes should return list of css clases for <li> tags" do
    expected = [
      "", "", "", "", "", "", "", "", "", "", "", "", "",
      "", "", "", "", "", "", "", "", "", "", "", "", "",
      "", "", "class=\"selected\"", ""]
    assert_equal expected, TeamPresenter.new(@context).li_classes
  end

end
