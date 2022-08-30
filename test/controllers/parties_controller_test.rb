require "test_helper"

class PartiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parties_index_url
    assert_response :success
  end

  test "should get show" do
    get parties_show_url
    assert_response :success
  end

  test "should get new" do
    get parties_new_url
    assert_response :success
  end

  test "should get create" do
    get parties_create_url
    assert_response :success
  end

  test "should get edit" do
    get parties_edit_url
    assert_response :success
  end

  test "should get update" do
    get parties_update_url
    assert_response :success
  end

  test "should get destroy" do
    get parties_destroy_url
    assert_response :success
  end
end
