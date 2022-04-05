require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test '#transfer' do
    sender_account = accounts(:account_one)
    receiver_account = accounts(:account_two)
    sender_account.transfer(receiver_account, 1000)
    assert_equal sender_account.balance, 2500
  end
end
