require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:context)
    assert_not_nil assigns(:season_presenter)
    assert_not_nil assigns(:team_presenter)
    assert_not_nil assigns(:game_presenter)
    assert_not_nil assigns(:season_link_presenter)
    assert_not_nil assigns(:game_link_presenter)
    assert_not_nil assigns(:misc_link_presenter)
    assert_not_nil assigns(:cache_key)
  end

  test "should store last used team in cookies" do
    get :index, params: { team: "SJS" }
    assert_equal "SJS", cookies[:team]
  end

  test "should read last used team from cookies" do
    cookies[:team] = "SJS"
    get :index
    assert_equal "SJS", assigns(:context).team.abbreviation
  end
end
