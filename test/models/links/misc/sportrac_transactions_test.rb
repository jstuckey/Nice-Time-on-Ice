require 'test_helper'

class Links::Misc::SportracTransactionsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Sportrac", Links::Misc::SportracTransactions.new.site_name
  end

  test "#description" do
    assert_equal "Transactions", Links::Misc::SportracTransactions.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.spotrac.com/nhl/transactions/"

    link = Links::Misc::SportracTransactions.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 7, Links::Misc::SportracTransactions.new.group
  end

  test "#position" do
    assert_equal 3, Links::Misc::SportracTransactions.new.position
  end

end
