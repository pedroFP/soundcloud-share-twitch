require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  test "Unsub viewer cannot like the same track" do
    unsub_viewer = viewers(:not_sub)
    track = tracks(:one)
    total_likes = 1

    track.create_likes unsub_viewer, viewer: unsub_viewer, track: track
    track.create_likes unsub_viewer, viewer: unsub_viewer, track: track

    assert_equal total_likes, track.likes.where(viewer: unsub_viewer).size
  end

  test "Sub viewer cannot like the same track" do
    sub_viewer = viewers(:sub)
    track = tracks(:one)
    total_likes = 3

    track.create_likes sub_viewer, viewer: sub_viewer, track: track
    track.create_likes sub_viewer, viewer: sub_viewer, track: track

    assert_equal total_likes, track.likes.where(viewer: sub_viewer).size
  end
end
