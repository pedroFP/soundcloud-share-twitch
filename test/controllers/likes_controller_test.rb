require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @track = tracks(:one)
    @track_likes_count = @track.likes_count
  end

  test 'viewer should give 3 likes when sub' do
    sub_viewer = viewers(:sub)

    sign_in sub_viewer

    post track_likes_path(@track), xhr: true

    assert_response :success
    assert_equal @track_likes_count + 3, @track.reload.likes_count
  end

  test 'viewer should give 1 like when is not sub' do
    unsub_viewer = viewers(:not_sub)

    sign_in unsub_viewer

    post track_likes_path(@track), xhr: true

    assert_response :success
    assert_equal @track_likes_count + 1, @track.reload.likes_count
  end
end
