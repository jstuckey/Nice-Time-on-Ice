require 'test_helper'

class Links::Misc::PonCorsiTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Puck on Net", Links::Misc::PonCorsi.new.site_name
  end

  test "#description" do
    assert_equal "Corsi", Links::Misc::PonCorsi.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://www.fenwick-stats.com/corsi.php?s=2014-10-01&e=2015-07-1&f=0&ld=1&l=82"

    link = Links::Misc::PonCorsi.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 4, Links::Misc::PonCorsi.new.group
  end

  test "#position" do
    assert_equal 0, Links::Misc::PonCorsi.new.position
  end

end
