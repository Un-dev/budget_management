require 'application_system_test_case'

class AuthTest < ApplicationSystemTestCase
  test 'can sign in' do
    user = User.first
    visit '/'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'tototo'
    click_on 'Log in'

    assert_text "Bonjour, #{user.surname}"
  end

  test 'registration should redirect to Account creation' do
    visit '/'
    click_on 'Sign up'
    fill_in 'user_email', with: 'new@user.fr'
    fill_in 'user_name', with: 'new'
    fill_in 'user_surname', with: 'user'
    fill_in 'user_password', with: 'newuser'
    fill_in 'user_password_confirmation', with: 'newuser'
    find('#confirm-signup').click
    assert_text 'Nouveau compte'
  end
end
