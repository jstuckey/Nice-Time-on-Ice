require 'test_helper'

class SportracLinkPresenterTest < ActiveSupport::TestCase
  def setup
    context = RequestContext.new(
      season: seasons(:fourteen),
      team: teams(:caps),
      game: games(:game_one),
      game_type: "regular"
    )

    @subject = SportracLinkPresenter.new(context)
  end

  test "#names returns a list of Sportrac page names for the game/team/season" do
    actual_names = @subject.names
    expected_names.zip(actual_names) do |expected_name, actual_name|
      assert_equal expected_name, actual_name
    end
  end

  test "#links returns a list of Sportrac links for the game/team/season" do
    actual_links = @subject.links
    expected_links.zip(actual_links) do |expected_link, actual_link|
      assert_equal expected_link, actual_link
    end
  end

  def expected_names
    [
      "Financial Summary",
      "Contracts",
      "Salary Cap Table",
      "Multi-Year Breakdown",
      "Positional Spending",
      "Free Agents",
      "Transactions",
      "Buyout Calculator"
    ]
  end

  def expected_links
    %w(
      http://www.spotrac.com/nhl/washington-capitals/2014
      http://www.spotrac.com/nhl/washington-capitals/contracts/2014
      http://www.spotrac.com/nhl/washington-capitals/cap/2014
      http://www.spotrac.com/nhl/washington-capitals/yearly/cap/2014
      http://www.spotrac.com/nhl/washington-capitals/positional/2014
      http://www.spotrac.com/nhl/transactions/2014/washington-capitals
      http://www.spotrac.com/nhl/tools/buyout-calculator
    )
  end
end
