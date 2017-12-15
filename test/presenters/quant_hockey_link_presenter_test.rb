require 'test_helper'

class QuantHockeyLinkPresenterTest < ActiveSupport::TestCase
  def setup
    context = RequestContext.new(
      season: seasons(:fourteen),
      team: teams(:caps),
      game: games(:game_one),
      game_type: "regular"
    )

    @subject = QuantHockeyLinkPresenter.new(context)
  end

  test "#names returns a list of Quant Hockey page names for the game/team/season" do
    actual_names = @subject.names
    expected_names.zip(actual_names) do |expected_name, actual_name|
      assert_equal expected_name, actual_name
    end
  end

  test "#links returns a list of Quant Hockey links for the game/team/season" do
    actual_links = @subject.links
    expected_links.zip(actual_links) do |expected_link, actual_link|
      assert_equal expected_link, actual_link
    end
  end

  def expected_names
    [
      "Team Stats",
      "Player Stats"
    ]
  end

  def expected_links
    %w[
      http://www.quanthockey.com/nhl/teams/washington-capitals-players-2014-15-nhl-stats.html
      http://www.quanthockey.com/nhl/seasons/2014-15-nhl-players-stats.html
    ]
  end
end
