require "test_helper"

class User::BorrowingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_borrowings_index_url
    assert_response :success
  end

  test "should get show" do
    get user_borrowings_show_url
    assert_response :success
  end
end
