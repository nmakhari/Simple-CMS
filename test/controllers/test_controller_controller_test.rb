require 'test_helper'

class TestControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get test_view" do
    get test_controller_test_view_url
    assert_response :success
  end

end
