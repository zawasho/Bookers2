require 'test_helper'

class LayoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get layouts_new_url
    assert_response :success
  end

end
