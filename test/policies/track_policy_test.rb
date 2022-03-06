require 'test_helper'

class TrackPolicyTest < ActiveSupport::TestCase

  setup do
    @track = tracks(:one)
  end

  test 'Viewer should create tracks' do
    @viewer = viewers(:not_sub)

    assert_permit @viewer, @track, :create
  end

  test 'Admins should not create tracks' do
    @admin = admins(:one)

    refute_permit @admin, @track, :create
  end
end
