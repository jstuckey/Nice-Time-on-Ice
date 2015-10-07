require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get api/seasons" do
    get :seasons
    assert_response :success
    puts response
  end

  test "should get api/seasons/:id" do
    skip
  end

  test "should get api/seasons/:id/games" do
    skip
  end

  test "should get api/seasons/:id/games/:id" do
    skip
  end

  test "should get api/seasons/:id/games/:id/links" do
    skip
  end

  test "should get api/teams" do
    skip
  end

  test "should get api/teams/:id" do
    skip
  end

  test "should get api/teams/:id/seasons" do
    skip
  end

  test "should get api/teams/:id/seasons/:id" do
    skip
  end

  test "should get api/teams/:id/seasons/:id/links" do
    skip
  end

end
