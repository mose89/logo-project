require 'test_helper'

class OrderNotesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get order_notes_new_url
    assert_response :success
  end

  test "should get edit" do
    get order_notes_edit_url
    assert_response :success
  end

end
