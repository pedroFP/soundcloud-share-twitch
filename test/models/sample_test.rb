require 'test_helper'

class SampleTest < ActiveSupport::TestCase
  setup do
    @sample = Sample.new
    @link = 'https://duckduckgo.com/'
  end

  test 'It should belong to a stream' do
    @sample.name = 'Name'
    @sample.link = @link

    assert_not @sample.valid?

    assert_includes @sample.errors.full_messages, 'Stream must exist'
  end

  test 'It should have a name' do
    @sample.link = @link
    @sample.stream = streams(:one)

    assert_not @sample.valid?

    assert_includes @sample.errors.full_messages, "Name can't be blank"
  end

  test 'It should have a link' do
    @sample.name = 'Name'
    @sample.stream = streams(:one)

    assert_not @sample.valid?

    assert_includes @sample.errors.full_messages, "Link can't be blank"
  end

  test 'It should not be a valid link' do
    @sample.name = 'Name'
    @sample.stream = streams(:one)
    @sample.link = 'link'

    assert_not @sample.valid?

    assert_includes @sample.errors.full_messages, "Link is invalid"
  end

  test 'It should be valid' do
    @sample.name = 'Name'
    @sample.link = @link
    @sample.stream = streams(:one)

    assert @sample.valid?
  end
end
