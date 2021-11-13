require 'test_helper'

class StreamTest < ActiveSupport::TestCase
  test 'It should no be saved' do
    stream = Stream.new
    assert_not stream.valid?
  end

  test 'It should no be saved, user must exist' do
    stream = Stream.new
    stream.title = 'Lorem'
    error_message = 'Admin must exist'

    assert_not stream.valid?
    assert stream.errors.full_messages.include?(error_message)
  end

  test 'It should no be saved, title cant be blank' do
    stream = Stream.new
    stream.admin = admins(:one)
    error_message = "Title can't be blank"

    assert_not stream.valid?
    assert stream.errors.full_messages.include?(error_message)
  end

  test 'It should destroy related tracks when deleted' do
    stream = streams(:one)
    stream_id = stream.id
    stream.destroy

    assert_equal 0, Track.where(stream_id: stream_id).count
  end
end