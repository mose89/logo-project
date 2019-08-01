require 'test_helper'

class SingleOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get single_orders_new_url
    assert_response :success
  end

  test "should get show" do
    get single_orders_show_url
    assert_response :success
  end

  test "should get edit" do
    get single_orders_edit_url
    assert_response :success
  end

  test "should get index" do
    get single_orders_index_url
    assert_response :success
  end

end
