require 'test_helper'

class SamplePolicyTest < ActiveSupport::TestCase

  test 'Viewers should not create samples' do
    @viewer = viewers(:not_sub)
    @sample = Sample.new(name: 'Sample', link: 'https"//www.test.com')

    refute_permit @viewer, @sample, :create
  end

  test 'Admins should create samples' do
    @admin = admins(:one)
    @sample = Sample.new(name: 'Sample', link: 'https"//www.test.com')

    assert_permit @admin, @sample, :create
  end
  test 'Viewers should not destroy samples' do
    @viewer = viewers(:not_sub)
    @sample = samples(:one)

    refute_permit @viewer, @sample, :destroy
  end

  test 'Admins should destroy samples' do
    @admin = admins(:one)
    @sample = samples(:one)

    assert_permit @admin, @sample, :destroy
  end
end
