require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup { @user = User.find_by(surname: 'toto') }

  test '#total_balance' do
    assert_equal 2, @user.accounts.count
    assert_equal 6000, @user.total_balance
  end
end
