require 'test_helper'

class GalleryControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get gallery_new_url
    assert_response :success
  end

  test "should get edit" do
    get gallery_edit_url
    assert_response :success
  end

  test "should get index" do
    get gallery_index_url
    assert_response :success
  end

end
