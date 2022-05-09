require 'application_system_test_case'

class LoginTest < ApplicationSystemTestCase
  test 'can sign in' do
    user = User.first
    visit '/users/sign_in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'tototo'
    click_on 'Log in'

    assert_text "Bonjour, #{user.surname}"
  end
end
