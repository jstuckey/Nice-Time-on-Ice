require 'test_helper'

class HockeyStatsLinkPresenterTest < ActiveSupport::TestCase
  def setup
    context = RequestContext.new(
      season: seasons(:fourteen),
      team: teams(:caps),
      game: games(:game_one),
      game_type: "regular"
    )

    @subject = HockeyStatsLinkPresenter.new(context)
  end

  test "#names returns a list of Hockey Stats page names for the game/team/season" do
    actual_names = @subject.names
    expected_names.zip(actual_names) do |expected_name, actual_name|
      assert_equal expected_name, actual_name
    end
  end

  test "#links returns a list of Hockey Stats links for the game/team/season" do
    actual_links = @subject.links
    expected_links.zip(actual_links) do |expected_link, actual_link|
      assert_equal expected_link, actual_link
    end
  end

  def expected_names
    [
      "Game Possession",
      "Game Shifts",
      "Playoff Probabilities",
      "Lottery Pick Probabilities"
    ]
  end

  def expected_links
    %w(
      http://hockeystats.ca/game/2014021201
      http://hockeystats.ca/game/2014021201/shifts
      http://hockeystats.ca/playoffs
      http://hockeystats.ca/lottery
    )
  end
end
