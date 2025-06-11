require "test_helper"

class User::AuthorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_authors_index_url
    assert_response :success
  end

  test "should get show" do
    get user_authors_show_url
    assert_response :success
  end
end
