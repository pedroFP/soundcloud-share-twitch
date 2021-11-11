require 'test_helper'

class TrackTest < ActiveSupport::TestCase

  test 'it should not be valid' do
    track = Track.new
    assert_not track.valid?
  end

  test 'it should have a viewer' do
    track = Track.new

    assert_not track.valid?
  end

  test 'it should have the sound cloud url' do
    track = Track.new
    track.viewer = viewers(:not_sub)

    assert_not track.valid?
  end

  test 'it should be valid' do
    track = Track.new
    track.soundcloud_url = 'some_url'
    track.viewer = viewers(:not_sub)

    assert track.valid?
  end
end
