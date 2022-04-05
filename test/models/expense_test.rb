require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  test 'account assets are updated after an expense is created or updated' do
    account = Account.find_by(title: 'Principal')
    assert_equal 3500, account.assets
    expense =
      Expense.create(amount: -10, category: Category.first, account: account)
    assert_equal 3490, account.assets
    expense.update(amount: -20)
    assert_equal 3480, account.assets
    expense.update(amount: -5)
    assert_equal 3495, account.assets
    expense.update(amount: 20)
    assert_equal 3520, account.assets
    expense.update(amount: 15)
    assert_equal 3515, account.assets
    expense.destroy
    assert_equal 3500, account.assets
  end
end
