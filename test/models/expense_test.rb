require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  test 'account balance are updated after an expense is created or updated' do
    account = Account.find_by(title: 'Principal')
    assert_equal 3500, account.balance
    expense =
      Expense.create(amount: -10, category: Category.first, account: account)
    assert_equal 3490, account.balance
    expense.update(amount: -20)
    assert_equal 3480, account.balance
    expense.update(amount: -5)
    assert_equal 3495, account.balance
    expense.update(amount: 20)
    assert_equal 3520, account.balance
    expense.update(amount: 15)
    assert_equal 3515, account.balance
    expense.destroy
    assert_equal 3500, account.balance
  end
end
