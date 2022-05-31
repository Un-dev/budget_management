require 'application_system_test_case'

class ExpenseTest < ApplicationSystemTestCase
  setup do
    @user = User.first
    login_as(@user, scope: :user)
  end

  test 'can visit edit of entry' do
    visit edit_expense_path(Expense.first)
    assert_text 'Modifier l\'entrée'
  end
end
