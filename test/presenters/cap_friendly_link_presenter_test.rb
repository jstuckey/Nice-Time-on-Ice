require 'test_helper'

class CapFriendlyLinkPresenterTest < ActiveSupport::TestCase
  def setup
    context = RequestContext.new(
      season: seasons(:fourteen),
      team: teams(:caps),
      game: games(:game_one),
      game_type: "regular"
    )

    @subject = CapFriendlyLinkPresenter.new(context)
  end

  test "#names returns a list of Cap Friendly page names for the game/team/season" do
    actual_names = @subject.names
    expected_names.zip(actual_names) do |expected_name, actual_name|
      assert_equal expected_name, actual_name
    end
  end

  test "#links returns a list of Cap Friendly links for the game/team/season" do
    actual_links = @subject.links
    expected_links.zip(actual_links) do |expected_link, actual_link|
      assert_equal expected_link, actual_link
    end
  end

  def expected_names
    [
      "Cap Hits",
      "Signings",
      "Recalls and Assignments",
      "Injuries",
      "Trades",
      "Buyout Calculator",
      "Free Agents",
      "Draft Board",
      "Comparables"
    ]
  end

  def expected_links
    %w(
      https://www.capfriendly.com/teams/capitals
      https://www.capfriendly.com/signings
      https://www.capfriendly.com/transactions/recalls-reassignments
      https://www.capfriendly.com/transactions/injuries
      https://www.capfriendly.com/trades
      https://www.capfriendly.com/buyout_calculator
      https://www.capfriendly.com/browse/free-agents
      https://www.capfriendly.com/draft
      https://www.capfriendly.com/comparables
    )
  end
end
