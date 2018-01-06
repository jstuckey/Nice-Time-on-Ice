require 'test_helper'

class NhlLinkPresenterTest < ActiveSupport::TestCase
  def setup
    context = RequestContext.new(
      season: seasons(:fourteen),
      team: teams(:caps),
      game: games(:game_one),
      game_type: "regular"
    )

    @subject = NhlLinkPresenter.new(context)
  end

  test "#names returns a list of NHL.com page names for the game/team/season" do
    actual_names = @subject.names
    expected_names.zip(actual_names) do |expected_name, actual_name|
      assert_equal expected_name, actual_name
    end
  end

  test "#links returns a list of NHL.com links for the game/team/season" do
    actual_links = @subject.links
    expected_links.zip(actual_links) do |expected_link, actual_link|
      assert_equal expected_link, actual_link
    end
  end

  def expected_names
    [
      "Boxscore",
      "Recap",
      "Ice Tracker",
      "Game Summary",
      "Event Summary",
      "Faceoff Summary",
      "Play-by-Play",
      "Home Time on Ice",
      "Away Time on Ice",
      "Playing Roster",
      "Shot Report",
      "Video Highlights",
      "Shift Chart",
      "Schedule",
      "Summary",
      "Goals",
      "Assists",
      "Points",
      "Plus/Minus",
      "Powerplay",
      "Penalty Kill",
      "Shootout",
      "Faceoffs",
      "Penalties",
      "Time on Ice",
      "Real Time",
      "Shooting",
      "Percentages",
      "Shooting/TOI",
      "Scoring",
      "Bios"
    ]
  end

  def expected_links
    %w[
      http://www.nhl.com/ice/boxscore.htm?id=2014021201
      http://www.nhl.com/ice/recap.htm?id=2014021201
      http://www.nhl.com/ice/icetracker.htm?id=2014021201
      http://www.nhl.com/scores/htmlreports/20142015/GS021201.HTM
      http://www.nhl.com/scores/htmlreports/20142015/ES021201.HTM
      http://www.nhl.com/scores/htmlreports/20142015/FC021201.HTM
      http://www.nhl.com/scores/htmlreports/20142015/PL021201.HTM
      http://www.nhl.com/scores/htmlreports/20142015/TH021201.HTM
      http://www.nhl.com/scores/htmlreports/20142015/TV021201.HTM
      http://www.nhl.com/scores/htmlreports/20142015/RO021201.HTM
      http://www.nhl.com/scores/htmlreports/20142015/SS021201.HTM
      http://video.nhl.com/videocenter/embed?playlist=2014021201-X-h
      http://www.nhl.com/stats/shiftcharts?id=2014021201
      http://www.nhl.com/ice/schedulebyseason.htm?season=20142015&gameType=2&team=WSH&network=&venue=
      http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=summary
      http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=goals
      http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=assists
      http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=points
      http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=plusminus
      http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=powerplay
      http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=penaltykill
      http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=shootout
      http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=faceoffs
      http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=penalties
      http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=timeonice
      http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=realtime
      http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=skatersummaryshooting
      http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=skaterpercentages
      http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=skatershootingtimeonice
      http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=skaterscoring
      http://www.nhl.com/stats/player?team=WSH&season=20142015&gameType=2&report=bios
    ]
  end
end
