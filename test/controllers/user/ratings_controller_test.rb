require "test_helper"

class User::RatingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_ratings_index_url
    assert_response :success
  end

  test "should get show" do
    get user_ratings_show_url
    assert_response :success
  end
end
