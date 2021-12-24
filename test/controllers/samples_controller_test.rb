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

  test 'Viewers should not create samples' do
    @stream = streams(:one)
    @viewer = viewers(:not_sub)
    sample_params = {
      name: 'Sample',
      link: 'www.localhost.com'
    }

    sign_in @viewer

    assert_raises(Pundit::NotAuthorizedError) do
      post stream_samples_path(@stream), xhr: true, params: {
        sample: sample_params
      }
    end
  end

  test 'Viewers should not destroy samples' do
    @stream = streams(:one)
    @viewer = viewers(:not_sub)
    @sample = samples(:one)
    sign_in @viewer

    assert_raises(Pundit::NotAuthorizedError) do
      delete stream_sample_path(@stream, @sample), xhr: true
    end
  end

end
