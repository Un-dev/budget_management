require 'test_helper'

class TransferTest < ActiveSupport::TestCase
  test '#transfer' do
    sender_account = accounts(:account_one)
    receiver_account = accounts(:account_two)
    assert_equal 3500, sender_account.balance
    assert_equal 2500, receiver_account.balance
    Transfer.create(
      from_account: sender_account,
      to_account: receiver_account,
      amount: 100,
    )
    assert_equal 3400, sender_account.balance
    assert_equal 2600, receiver_account.balance
  end
end
