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
  end

end
