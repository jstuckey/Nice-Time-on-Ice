require 'test_helper'

class NaturalStatTrickPresenterTest < ActiveSupport::TestCase
  def setup
    context = RequestContext.new(
      season: seasons(:fourteen),
      team: teams(:caps),
      game: games(:game_one),
      game_type: "regular"
    )

    @subject = NaturalStatTrickPresenter.new(context)
  end

  test "#names returns a list of NST page names for the game/team/season" do
    actual_names = @subject.names
    expected_names.zip(actual_names) do |expected_name, actual_name|
      assert_equal expected_name, actual_name
    end
  end

  test "#links returns a list of NST links for the game/team/season" do
    actual_links = @subject.links
    expected_links.zip(actual_links) do |expected_link, actual_link|
      assert_equal expected_link, actual_link
    end
  end

  def expected_names
    [
      "Game Statistics",
      "Player Totals - On-Ice",
      "Player Totals - Individual",
      "Player Totals - Bios",
      "Player Index",
      "Line Tool",
      "Team Totals"
    ]
  end

  def expected_links
    %w[
      http://naturalstattrick.com/game.php?season=20142015&game=21201
      http://naturalstattrick.com/playerteams.php?stdoi=oi&season=20142015&stype=2&team=WSH
      http://naturalstattrick.com/playerteams.php?stdoi=std&season=20142015&stype=2&team=WSH
      http://naturalstattrick.com/playerteams.php?stdoi=bio&season=20142015&stype=2&team=WSH
      http://naturalstattrick.com/playerlist.php?season=20142015
      http://naturalstattrick.com/linestats.php?season=20142015&stype=2&team=WSH
      http://naturalstattrick.com/teamtable.php?season=20142015&stype=2
    ]
  end
end
