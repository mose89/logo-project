require 'test_helper'

class ContactMailersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get contact_mailers_new_url
    assert_response :success
  end

  test "should get show" do
    get contact_mailers_show_url
    assert_response :success
  end

  test "should get edit" do
    get contact_mailers_edit_url
    assert_response :success
  end

  test "should get index" do
    get contact_mailers_index_url
    assert_response :success
  end

end
