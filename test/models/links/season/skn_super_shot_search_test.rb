require 'test_helper'

class Links::Season::SknSuperShotSearchTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Some Kind of Ninja", Links::Season::SknSuperShotSearch.new.site_name
  end

  test "#description" do
    assert_equal "Super Shot Search", Links::Season::SknSuperShotSearch.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://somekindofninja.com/nhl/index.php?season=Regular&year=2014-2015&shots=For&team=Washington+Capitals&ice_player_name=&withPlayer=On+Ice&player_name=&goalie_name=&event=Shots+and+Goals&game=Away&strength=Even&time=Regulation&search=Search"

    link = Links::Season::SknSuperShotSearch.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 4, Links::Season::SknSuperShotSearch.new.group
  end

  test "#position" do
    assert_equal 1, Links::Season::SknSuperShotSearch.new.position
  end

end
