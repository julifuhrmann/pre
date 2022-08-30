require "test_helper"

class ReviesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get revies_index_url
    assert_response :success
  end

  test "should get show" do
    get revies_show_url
    assert_response :success
  end

  test "should get new" do
    get revies_new_url
    assert_response :success
  end

  test "should get create" do
    get revies_create_url
    assert_response :success
  end
end
