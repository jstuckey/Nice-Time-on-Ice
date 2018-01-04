require 'test_helper'

class HockeyVizLinkPresenterTest < ActiveSupport::TestCase
  def setup
    context = RequestContext.new(
      season: seasons(:fourteen),
      team: teams(:caps),
      game: games(:game_one),
      game_type: "regular"
    )

    @subject = HockeyVizLinkPresenter.new(context)
  end

  test "#names returns a list of HockeyViz page names for the game/team/season" do
    actual_names = @subject.names
    expected_names.zip(actual_names) do |expected_name, actual_name|
      assert_equal expected_name, actual_name
    end
  end

  test "#links returns a list of HockeyViz links for the game/team/season" do
    actual_links = @subject.links
    expected_links.zip(actual_links) do |expected_link, actual_link|
      assert_equal expected_link, actual_link
    end
  end

  def expected_names
    [
      "Team Overview",
      "Game Overview",
      "Shot Tide",
      "5v5 Shots",
      "5v5 Matchups",
      "Home Player Usage",
      "Away Player Usage",
      "Home Zone Deployment",
      "Away Zone Deployment"
    ]
  end

  def expected_links
    %w(
      http://hockeyviz.com/team/WSH/1415
      http://hockeyviz.com/game/2014021201
      http://hockeyviz.com/game/2014021201/tide
      http://hockeyviz.com/game/2014021201/byPlayer
      http://hockeyviz.com/game/2014021201/matchups
      http://hockeyviz.com/game/2014021201/homeUsage
      http://hockeyviz.com/game/2014021201/awayUsage
      http://hockeyviz.com/game/2014021201/homeZone
      http://hockeyviz.com/game/2014021201/awayZone
    )
  end
end
