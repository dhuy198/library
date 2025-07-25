require "test_helper"

class User::BorrowingItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_borrowing_items_index_url
    assert_response :success
  end

  test "should get show" do
    get user_borrowing_items_show_url
    assert_response :success
  end
end
