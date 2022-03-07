require 'test_helper'

class StreamsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get index" do
    get streams_url
    assert_response :success
  end

  test "should get show" do
    @stream = streams(:one)
    get stream_path(@stream)
    assert_response :success
  end

  test "Admins should get new" do
    @admin = admins(:one)
    sign_in @admin
    get new_stream_path
    assert_response :success
  end

  test "Admin should create streams" do
    @admin = admins(:one)
    sign_in @admin
    streams_count = Stream.count
    stream_params = {
      title: 'Lorem',
      aired_at: Time.now,
      receiving_tracks: false
    }

    post streams_path, params: {
      stream: stream_params
    }

    assert_equal (streams_count + 1), Stream.count

    assert_response :redirect
  end

  test "Viewer should not get new" do
    @viewer = viewers(:not_sub)
    sign_in @viewer

    get new_stream_path

    assert_response :redirect
  end

  test "Viewer should not create streams" do
    @viewer = viewers(:not_sub)
    sign_in @viewer
    streams_count = Stream.count
    stream_params = {
      title: 'Lorem',
      aired_at: Time.now,
      receiving_tracks: false
    }

    post streams_path, params: {
      stream: stream_params
    }

    assert_equal streams_count, Stream.count

    assert_response :redirect
  end

end
