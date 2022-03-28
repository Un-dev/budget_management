require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup { @user = User.find_by(surname: 'toto') }

  test '#total_assets' do
    assert_equal 8705, @user.total_assets
  end
end
