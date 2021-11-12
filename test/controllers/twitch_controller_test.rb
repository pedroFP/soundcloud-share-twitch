require 'test_helper'

class TwitchControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get twitch_login_url
    assert_response :success
  end

end
