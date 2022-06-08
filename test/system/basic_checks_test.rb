require 'application_system_test_case'

class BasicChecksTest < ApplicationSystemTestCase
  setup do
    @user = User.first
    login_as(@user, scope: :user)
  end

  test 'can visit all pages' do
    visit '/'
    assert_text "Bonjour, #{@user.surname}"
    visit '/budgets'
    assert_text 'Budgets'
    visit '/transfers/new'
    assert_text 'Nouveau transfert'
    visit '/expenses/new'
    assert_text 'Nouvelle entrée'
    visit '/accounts/new'
    assert_text 'Nouveau compte'
    visit '/analytics'
    assert_text 'Analyse'
  end
end
