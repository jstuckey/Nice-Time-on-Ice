require 'test_helper'

class Links::Season::FaceoffsDotNetFaceoffsTest < ActiveSupport::TestCase

  test "#site_name" do
    assert_equal "Faceoffs.net", Links::Season::FaceoffsDotNetFaceoffs.new.site_name
  end

  test "#description" do
    assert_equal "Faceoffs", Links::Season::FaceoffsDotNetFaceoffs.new.description
  end

  test "#url" do
    season = seasons(:fourteen)
    team = teams(:caps)
    game_type = "regular"

    url = "http://faceoffs.net/team/WSH?year=2014-15"

    link = Links::Season::FaceoffsDotNetFaceoffs.new(team: team, season: season, game_type: game_type)
    assert_equal url, link.url
  end

  test "#group" do
    assert_equal 6, Links::Season::FaceoffsDotNetFaceoffs.new.group
  end

  test "#position" do
    assert_equal 0, Links::Season::FaceoffsDotNetFaceoffs.new.position
  end

end
