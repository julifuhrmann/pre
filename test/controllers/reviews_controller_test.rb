require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reviews_index_url
    assert_response :success
  end

  test "should get show" do
    get reviews_show_url
    assert_response :success
  end

  test "should get new" do
    get reviews_new_url
    assert_response :success
  end

  test "should get create" do
    get reviews_create_url
    assert_response :success
  end
end
