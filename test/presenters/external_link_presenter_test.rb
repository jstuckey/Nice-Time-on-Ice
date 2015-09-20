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
      %Q(<a class="link" target="new" href="http://www.nhl.com/ice/schedulebyseason.htm?season=20142015&amp;gameType=2&amp;team=WSH&amp;network=&amp;venue=">Schedule</a>),
      %Q(<a class="link" target="new" href="http://www.nhl.com/ice/playerstats.htm?season=20142015&amp;gameType=2&amp;team=WSH&amp;position=S&amp;country=&amp;status=&amp;viewName=summary">Summary</a>),
      %Q(<a class="link" target="new" href="http://www.nhl.com/ice/playerstats.htm?gameType=2&amp;position=S&amp;season=20142015&amp;sort=goals&amp;status=A&amp;team=WSH&amp;viewName=goals">Goals</a>),
      %Q(<a class="link" target="new" href="http://www.nhl.com/ice/playerstats.htm?gameType=2&amp;position=S&amp;season=20142015&amp;sort=assists&amp;status=A&amp;team=WSH&amp;viewName=assists">Assists</a>),
      %Q(<a class="link" target="new" href="http://www.nhl.com/ice/playerstats.htm?gameType=2&amp;position=S&amp;season=20142015&amp;sort=penaltyMinutes&amp;status=A&amp;team=WSH&amp;viewName=penalties">Penalties</a>),
      %Q(<a class="link" target="new" href="http://www.nhl.com/ice/playerstats.htm?gameType=2&amp;position=S&amp;season=20142015&amp;sort=powerPlayGoals&amp;status=A&amp;team=WSH&amp;viewName=scoringLeaders">Special Teams</a>),
      %Q(<a class="link" target="new" href="http://www.nhl.com/ice/playerstats.htm?gameType=2&amp;position=S&amp;season=20142015&amp;sort=totalFaceOffs&amp;status=A&amp;team=WSH&amp;viewName=faceOffPercentageAll">Faceoffs</a>),
      %Q(<a class="link" target="new" href="http://www.nhl.com/ice/playerstats.htm?gameType=2&amp;position=S&amp;season=20142015&amp;sort=timeOnIce&amp;status=A&amp;team=WSH&amp;viewName=timeOnIce">Time on Ice</a>),
      %Q(<a class="link" target="new" href="http://www.hockey-reference.com/teams/WSH/2015.html">Roster and Statistics</a>),
      %Q(<a class="link" target="new" href="http://www.hockey-reference.com/teams/WSH/2015_games.html">Schedule and Results</a>),
      %Q(<a class="link" target="new" href="http://www.behindthenet.ca/nhl_statistics.php?ds=29&amp;f1=2014_s&amp;f2=5v5&amp;f5=WSH&amp;c=0+3+4+6+7+8+29+30+31+13+14+15+16+11+12+34+32+33+35+36+17+18+19+20+21+22+25+26+27+28+10+37+38+39+40+47+48+49+50+51+52+53+54+55+56+63+67+57+58+59+60+61+62+64+65+66+41+42+43+44+45+46">Player Breakdown</a>),
      %Q(<a class="link" target="new" href="http://www.behindthenet.ca/nhl_shot_statistics.php?ds=13&amp;f1=2014_s&amp;f2=5v5&amp;f5=WSH&amp;c=0+1+3+5+4+7+8+9+10+11+12+13+14+15+16+17+18+19+20+21+22+23+24+25+26+27+28">Player Shooting</a>),
      %Q(<a class="link" target="new" href="http://www.behindthenet.ca/nhl_time_on_ice_stats.php?ds=8&amp;f1=2014_s&amp;f2=5v5&amp;f5=WSH&amp;c=0+1+3+5+8+9+10+11+12+13+14+15+16+17+18+19+20+21+22+23+24+25+26+27+28">Linemates</a>),
      %Q(<a class="link" target="new" href="http://stats.hockeyanalysis.com/ratings.php?db=201415&amp;sit=5v5&amp;type=goals&amp;teamid=30&amp;pos=skaters&amp;minutes=50&amp;disp=1">Player Ratings (Goals)</a>),
      %Q(<a class="link" target="new" href="http://stats.hockeyanalysis.com/ratings.php?db=201415&amp;sit=5v5&amp;type=fenwick&amp;teamid=30&amp;pos=skaters&amp;minutes=50&amp;disp=1">Player Ratings (Fenwick)</a>),
      %Q(<a class="link" target="new" href="http://stats.hockeyanalysis.com/ratings.php?db=201415&amp;sit=5v5&amp;type=individual&amp;teamid=30&amp;pos=skaters&amp;minutes=50&amp;disp=1">Individual Stats</a>),
      %Q(<a class="link" target="new" href="http://somekindofninja.com/nhl/usage.php?f1=2014_s&amp;f2=5v5&amp;f3=&amp;f5=WSH&amp;f4=&amp;f7=&amp;update-filters=Update+Results">Player Usage Chart</a>),
      %Q(<a class="link" target="new" href="http://somekindofninja.com/nhl/index.php?season=Regular&amp;year=2014-2015&amp;shots=For&amp;team=Washington+Capitals&amp;ice_player_name=&amp;withPlayer=On+Ice&amp;player_name=&amp;goalie_name=&amp;event=Shots+and+Goals&amp;game=Away&amp;strength=Even&amp;time=Regulation&amp;search=Search">Super Shot Search</a>),
      %Q(<a class="link" target="new" href="http://war-on-ice.com/teambygame.html?team=WSH">Stats by Game/Season</a>),
      %Q(<a class="link" target="new" href="http://war-on-ice.com/playertable.html?team=WSH&amp;start0=20142015&amp;end0=20142015">Player Comparison</a>),
      %Q(<a class="link" target="new" href="http://faceoffs.net/team/WSH?year=2014-15">Faceoffs</a>)]

    assert_equal expected, ExternalLinkPresenter.new(@context, :season).links
  end

  test "#links should return list of anchor tags for each game link" do
    expected = [
      %Q(<a class="link" target="new" href="http://www.nhl.com/ice/boxscore.htm?id=2014021217">Boxscore</a>),
      %Q(<a class="link" target="new" href="http://www.nhl.com/ice/recap.htm?id=2014021217">Recap</a>),
      %Q(<a class="link" target="new" href="http://www.nhl.com/ice/icetracker.htm?id=2014021217">Ice Tracker</a>),
      %Q(<a class="link" target="new" href="http://www.nhl.com/scores/htmlreports/20142015/GS021217.HTM">Game Summary</a>),
      %Q(<a class="link" target="new" href="http://www.nhl.com/scores/htmlreports/20142015/ES021217.HTM">Event Summary</a>),
      %Q(<a class="link" target="new" href="http://www.nhl.com/scores/htmlreports/20142015/FC021217.HTM">Faceoff Summary</a>),
      %Q(<a class="link" target="new" href="http://www.nhl.com/scores/htmlreports/20142015/PL021217.HTM">Play-by-Play</a>),
      %Q(<a class="link" target="new" href="http://www.nhl.com/scores/htmlreports/20142015/TH021217.HTM">Home Time on Ice</a>),
      %Q(<a class="link" target="new" href="http://www.nhl.com/scores/htmlreports/20142015/TV021217.HTM">Away Time on Ice</a>),
      %Q(<a class="link" target="new" href="http://www.nhl.com/scores/htmlreports/20142015/RO021217.HTM">Playing Roster</a>),
      %Q(<a class="link" target="new" href="http://www.nhl.com/scores/htmlreports/20142015/SS021217.HTM">Shot Report</a>),
      %Q(<a class="link" target="new" href="http://nullisecund.us/nhl/game.php?id=21217">Even Strength Shooting</a>),
      %Q(<a class="link" target="new" href="http://nullisecund.us/nhl/toi.php?id=21217">Shift Chart</a>),
      %Q(<a class="link" target="new" href="http://war-on-ice.com/game.html?seasongcode=2014201521217">Game Statistics</a>),
      %Q(<a class="link" target="new" href="http://hockeystats.ca/game/2014021217">Game Statistics</a>),
      %Q(<a class="link" target="new" href="http://naturalstattrick.com/game.php?season=20142015&amp;game=21217">Game Statistics</a>)]

    assert_equal expected, ExternalLinkPresenter.new(@context, :game).links
  end

  test "#headers should return list of <h4> tags for each season link site name" do
    expected = ["NHL.com", nil, nil, nil, nil, nil, nil, nil,
      "Hockey-Reference", nil, "Behind the Net", nil, nil,
      "Hockey Analysis", nil, nil, "Some Kind of Ninja", nil,
      "War-on-Ice", nil, "Faceoffs.net"]
    assert_equal expected, ExternalLinkPresenter.new(@context, :season).headers
  end

  test "#headers should return list of <h4> tags for each game link site name" do
    expected = ["NHL.com", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,
      "Nullisecund", nil, "War-on-Ice", "Hockey Stats", "Natural Stat Trick"]
    assert_equal expected, ExternalLinkPresenter.new(@context, :game).headers
  end

end
