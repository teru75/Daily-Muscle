require 'test_helper'

class MyMenusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_menus_index_url
    assert_response :success
  end
end
