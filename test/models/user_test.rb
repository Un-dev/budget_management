require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup { @user = User.find_by(surname: 'toto') }

  test '#total_balance' do
    assert_equal 2, @user.accounts.count
    assert_equal 6000, @user.total_balance
  end

  test 'cant create user without name and surname' do
    user = User.new(password: 'toto', email: 'new@user.com')
    refute user.save
  end

  test 'User should have one budget for each category after its creation' do
    new_user =
      User.create(
        surname: 'new',
        name: 'user',
        email: 'new@user.com',
        password: 'newuser',
      )

    assert_equal Category.count, new_user.budgets.count
  end
end
