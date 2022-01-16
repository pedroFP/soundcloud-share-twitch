require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  test "Viewer cannot like twice the same track" do
    viewer = viewers(:not_sub)
    track = tracks(:one)

    like = Like.new(
      viewer: viewer,
      track: track
    )

    assert_not like.save
  end
end
