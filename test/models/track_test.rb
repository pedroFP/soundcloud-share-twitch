require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  setup do
    @track = Track.new
  end

  test 'it should not be valid' do
    assert_not @track.valid?
  end

  test 'it should have a viewer' do
    @track.soundcloud_url = 'Track'
    @track.stream = streams(:one)

    assert_not @track.valid?
  end

  test 'it should have the sound cloud url' do
    @track.viewer = viewers(:not_sub)
    @track.stream = streams(:one)

    assert_not @track.valid?
  end

  test 'it should have a stream' do
    @track.viewer = viewers(:not_sub)
    @track.soundcloud_url = 'url'

    assert_not @track.valid?
  end

  test 'it should be a invalid url' do
    @track.soundcloud_url = 'some_url'
    @track.viewer = viewers(:not_sub)
    @track.stream = streams(:one)

    assert_not @track.valid?
  end

  test 'it should be a valid url' do
    @track.soundcloud_url = 'https://soundcloud.com/paintrips/star-chasers-prod'
    @track.viewer = viewers(:not_sub)
    @track.stream = streams(:one)

    assert @track.valid?
  end
end
