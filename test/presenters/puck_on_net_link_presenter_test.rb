require 'test_helper'

class PuckOnNetLinkPresenterTest < ActiveSupport::TestCase
  def setup
    context = RequestContext.new(
      season: seasons(:fourteen),
      team: teams(:caps),
      game: games(:game_one),
      game_type: "regular"
    )

    @subject = PuckOnNetLinkPresenter.new(context)
  end

  test "#names returns a list of PuckOnNet page names for the game/team/season" do
    actual_names = @subject.names
    expected_names.zip(actual_names) do |expected_name, actual_name|
      assert_equal expected_name, actual_name
    end
  end

  test "#links returns a list of PuckOnNet links for the game/team/season" do
    actual_links = @subject.links
    expected_links.zip(actual_links) do |expected_link, actual_link|
      assert_equal expected_link, actual_link
    end
  end

  def expected_names
    [
      "Team Stats",
      "Corsi",
      "Fenwick",
      "Shots",
      "Goals",
      "Misses",
      "Blocks",
      "Hits"
    ]
  end

  def expected_links
    %w(
      http://www.puckon.net/index.php?f=0&s=2014-09-01&e=2015-06-30&l=82&p=0
      http://www.puckon.net/corsi.php?f=0&s=2017-09-01&e=2015-06-30&l=82&p=0
      http://www.puckon.net/fenwick.php?f=0&s=2014-09-01&e=2015-06-30&l=82&p=0
      http://www.puckon.net/shots.php?f=0&s=2014-09-01&e=2015-06-30&l=82&p=0
      http://www.puckon.net/goals.php?f=0&s=2014-09-01&e=2015-06-30&l=82&p=0
      http://www.puckon.net/misses.php?f=0&s=2014-09-01&e=2015-06-30&l=82&p=0
      http://www.puckon.net/blocks.php?f=0&s=2014-09-01&e=2015-06-30&l=82&p=0
      http://www.puckon.net/hits.php?f=0&s=2014-09-01&e=2015-06-30&l=82&p=0
    )
  end
end
