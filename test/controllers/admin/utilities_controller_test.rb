require "test_helper"

class Admin::UtilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get notification" do
    get admin_utilities_notification_url
    assert_response :success
  end
end
