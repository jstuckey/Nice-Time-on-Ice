require 'test_helper'

class GearGeekLinkPresenterTest < ActiveSupport::TestCase
  def setup
    context = RequestContext.new(
      season: seasons(:fourteen),
      team: teams(:caps),
      game: games(:game_one),
      game_type: "regular"
    )

    @subject = GearGeekLinkPresenter.new(context)
  end

  test "#names returns a list of GearGeek page names for the game/team/season" do
    actual_names = @subject.names
    expected_names.zip(actual_names) do |expected_name, actual_name|
      assert_equal expected_name, actual_name
    end
  end

  test "#links returns a list of GearGeek links for the game/team/season" do
    actual_links = @subject.links
    expected_links.zip(actual_links) do |expected_link, actual_link|
      assert_equal expected_link, actual_link
    end
  end

  def expected_names
    [
      "NHL Totals",
      "Brands",
      "Teams",
      "Forwards",
      "Defensemen",
      "Goalies",
      "Goals",
      "Salary Cap"
    ]
  end

  def expected_links
    %w[
      https://www.geargeek.com/
      https://www.geargeek.com/brands
      https://www.geargeek.com/team/washington-capitals
      https://www.geargeek.com/position/forwards
      https://www.geargeek.com/position/defenseman
      https://www.geargeek.com/position/goalie
      https://www.geargeek.com/stats/goals
      https://www.geargeek.com/salary
    ]
  end
end
