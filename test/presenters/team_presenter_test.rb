require 'test_helper'

class TeamPresenterTest < ActiveSupport::TestCase
  setup do
    @context = RequestContext.new(
      team: 'WSH',
      season: '2014',
      game_type: '2'
    )
  end

  # rubocop:disable Metrics/LineLength
  # rubocop:disable Metrics/BlockLength
  test "#links should return list of anchor tags for each team" do
    expected = [
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=ANA">Anaheim Ducks</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=ARI">Arizona Coyotes</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=BOS">Boston Bruins</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=BUF">Buffalo Sabres</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=CGY">Calgary Flames</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=CAR">Carolina Hurricanes</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=CHI">Chicago Blackhawks</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=COL">Colorado Avalanche</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=CBJ">Columbus Blue Jackets</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=DAL">Dallas Stars</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=DET">Detroit Red Wings</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=EDM">Edmonton Oilers</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=FLA">Florida Panthers</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=LAK">Los Angeles Kings</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=MIN">Minnesota Wild</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=MTL">Montreal Canadiens</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=NSH">Nashville Predators</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=NJD">New Jersey Devils</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=NYI">New York Islanders</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=NYR">New York Rangers</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=OTT">Ottawa Senators</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=PHI">Philadelphia Flyers</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=PIT">Pittsburgh Penguins</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=SJS">San Jose Sharks</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=STL">St. Louis Blues</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=TBL">Tampa Bay Lightning</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=TOR">Toronto Maple Leafs</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=VAN">Vancouver Canucks</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=WSH">Washington Capitals</a>),
      %(<a class="team" href="/?game_order=desc&game_type=2&season=2014&team=WPG">Winnipeg Jets</a>)
    ]

    # Not sure why href is html escaped
    expected = expected.map { |anchor| anchor.gsub("&", "&amp;") }

    assert_equal expected, TeamPresenter.new(@context).links
  end
  # rubocop:enable Metrics/LineLength
  # rubocop:enable Metrics/BlockLength

  test "#li_classes should return list of css clases for <li> tags" do
    expected = [
      "", "", "", "", "", "", "", "", "", "", "", "", "",
      "", "", "", "", "", "", "", "", "", "", "", "", "",
      "", "", "class=\"selected\"", ""
    ]
    assert_equal expected, TeamPresenter.new(@context).li_classes
  end
end
