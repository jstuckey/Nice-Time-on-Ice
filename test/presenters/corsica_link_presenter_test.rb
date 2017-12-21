require 'test_helper'

class CorsicaLinkPresenterTest < ActiveSupport::TestCase
  def setup
    context = RequestContext.new(
      season: seasons(:fourteen),
      team: teams(:caps),
      game: games(:game_one),
      game_type: "regular"
    )

    @subject = CorsicaLinkPresenter.new(context)
  end

  test "#names returns a list of Corsica page names for the game/team/season" do
    actual_names = @subject.names
    expected_names.zip(actual_names) do |expected_name, actual_name|
      assert_equal expected_name, actual_name
    end
  end

  test "#links returns a list of Corsica links for the game/team/season" do
    actual_links = @subject.links
    expected_links.zip(actual_links) do |expected_link, actual_link|
      assert_equal expected_link, actual_link
    end
  end

  def expected_names
    [
      "Game Stats",
      "Team Stats",
      "Skater Stats",
      "Goalie Stats",
      "Line Combinations",
      "Defence Pairings",
      "Player Profiles",
      "WAR",
      "Roster",
      "Predictions"
    ]
  end

  def expected_links
    %w(
      http://corsica.hockey/games/?id=2014021201
      http://corsica.hockey/team-stats/?season=20142015&session=Regular
      http://corsica.hockey/skater-stats/?season=20142015&session=Regular&team=WSH
      http://corsica.hockey/goalie-stats/?season=20142015&session=Regular&team=WSH
      http://corsica.hockey/line-stats/?season=20142015&session=Regular&team=WSH
      http://corsica.hockey/pairing-stats/?season=20142015&session=Regular&team=WSH
      http://corsica.hockey/player-profiles/?player=ALEX.OVECHKIN
      http://corsica.hockey/war/?season=20142015&team=WSH
      http://corsica.hockey/team-rosters/?team=WSH
      http://corsica.hockey/predictions/
    )
  end
end
