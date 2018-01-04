require 'test_helper'

class HockeyReferenceLinkPresenterTest < ActiveSupport::TestCase
  def setup
    context = RequestContext.new(
      season: seasons(:fourteen),
      team: teams(:caps),
      game: games(:game_one),
      game_type: "regular"
    )

    @subject = HockeyReferenceLinkPresenter.new(context)
  end

  test "#names returns a list of Hockey Reference page names for the game/team/season" do
    actual_names = @subject.names
    expected_names.zip(actual_names) do |expected_name, actual_name|
      assert_equal expected_name, actual_name
    end
  end

  test "#links returns a list of Hockey Reference links for the game/team/season" do
    actual_links = @subject.links
    expected_links.zip(actual_links) do |expected_link, actual_link|
      assert_equal expected_link, actual_link
    end
  end

  def expected_names
    [
      "Roster and Statistics",
      "Schedule and Results",
      "Advanced Stats Finder"
    ]
  end

  def expected_links
    %w(
      http://www.hockey-reference.com/teams/WSH/2015_games.html
      http://www.hockey-reference.com/teams/WSH/2015.html
      http://www.hockey-reference.com/play-index/tpbp_finder.cgi
    )
  end
end
