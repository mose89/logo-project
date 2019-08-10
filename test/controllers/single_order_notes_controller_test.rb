require 'test_helper'

class SingleOrderNotesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get single_order_notes_new_url
    assert_response :success
  end

  test "should get edit" do
    get single_order_notes_edit_url
    assert_response :success
  end

end
