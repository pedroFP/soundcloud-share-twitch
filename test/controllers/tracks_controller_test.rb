require 'test_helper'

class TracksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "Anyone should get index" do
    get tracks_url
    assert_response :success
  end

  test "Viewer should get new" do
    @viewer = viewers(:sub) # has no tracks on this stream
    @stream = streams(:one)
    sign_in @viewer

    get new_stream_track_path(@stream)

    assert_response :success
  end

  test "Viewer should create tracks" do
    @viewer = viewers(:not_sub)
    @stream = streams(:one)
    sign_in @viewer

    track_params = {
      soundcloud_url: 'https://soundcloud.com/paintrips/star-chasers-prod',
      stream_id: @stream.id,
      viewer_id: @viewer.id
    }

    post stream_tracks_path(@stream), params: {
      track: track_params
    }

    assert_response :redirect
  end

  test 'Admin should not get new' do
    @admin = admins(:one)
    @stream = streams(:one)
    sign_in @admin

    get new_stream_track_path(@stream)

    assert_response :redirect
  end

  test 'Admin should create tracks' do
    @admin = admins(:one)
    @stream = streams(:one)
    tracks_count = Track.count
    sign_in @admin

    track_params = {
      soundcloud_url: 'lorem',
      stream_id: @stream.id,
      viewer_id: viewers(:not_sub).id
    }

    post stream_tracks_path(@stream), params: {
      track: track_params
    }

    assert_equal tracks_count, Track.count

    assert_response :redirect
  end
end
