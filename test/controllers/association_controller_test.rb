require "test_helper"

class AssociationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get association_index_url
    assert_response :success
  end

  test "should get show" do
    get association_show_url
    assert_response :success
  end

  test "should get new" do
    get association_new_url
    assert_response :success
  end

  test "should get edit" do
    get association_edit_url
    assert_response :success
  end
end
