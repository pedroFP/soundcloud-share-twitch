require 'test_helper'

class SamplesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'Admins should create samples' do
    @stream = streams(:one)
    @admin = admins(:one)
    sample_params = {
      name: 'Sample',
      link: 'www.localhost.com'
    }

    sign_in @admin

    post stream_samples_path(@stream), xhr: true, params: {
      sample: sample_params
    }

    assert_response :success
  end

  test 'Admins should destroy samples' do
    @stream = streams(:one)
    @admin = admins(:one)
    @sample = samples(:one)
    sign_in @admin

    delete stream_sample_path(@stream, @sample), xhr: true

    assert_response :success
  end

end
