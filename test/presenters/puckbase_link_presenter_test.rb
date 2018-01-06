require 'test_helper'

class PuckbaseLinkPresenterTest < ActiveSupport::TestCase
  def setup
    context = RequestContext.new(
      season: seasons(:fourteen),
      team: teams(:caps),
      game: games(:game_one),
      game_type: "regular"
    )

    @subject = PuckbaseLinkPresenter.new(context)
  end

  test "#names returns a list of Puckbase page names for the game/team/season" do
    actual_names = @subject.names
    expected_names.zip(actual_names) do |expected_name, actual_name|
      assert_equal expected_name, actual_name
    end
  end

  test "#links returns a list of Puckbase links for the game/team/season" do
    actual_links = @subject.links
    expected_links.zip(actual_links) do |expected_link, actual_link|
      assert_equal expected_link, actual_link
    end
  end

  def expected_names
    [
      "Scoring",
      "Possession",
      "Goalies",
      "Faceoff Percentage",
      "Post-faceoff Percentage",
      "Faceoff Handedness Splits",
      "Faceoff Team Splits",
      "Faceoff Line Combinations",
      "Team Scoring",
      "Team Faceoffs"
    ]
  end

  def expected_links
    %w[
      http://puckbase.com/stats/scoring?team=WSH&season=2&year=2014
      http://puckbase.com/stats/possession?team=WSH&season=2&year=2014
      http://puckbase.com/stats/goalies?team=WSH&season=2&year=2014
      http://puckbase.com/stats/faceoff-percentage?team=WSH&season=2&year=2014
      http://puckbase.com/stats/post-faceoff-possession?team=WSH&season=2&year=2014
      http://puckbase.com/stats/faceoff-hand?team=WSH&season=2&year=2014
      http://puckbase.com/stats/team-faceoff-splits?team=WSH&season=2&year=2014
      http://puckbase.com/stats/team-lines?team=WSH&season=2&year=2014
      http://puckbase.com/stats/team-scoring&season=2&year=2014
      http://puckbase.com/stats/team-faceoffs&season=2&year=2014
    ]
  end
end
