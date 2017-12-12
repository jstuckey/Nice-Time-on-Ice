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
    ["Game Statistics"]
  end

  def expected_links
    ["http://naturalstattrick.com/game.php?season=20142015&game=21201"]
  end
end
