require 'test_helper'

class StreamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get streams_url
    assert_response :success
  end

end
