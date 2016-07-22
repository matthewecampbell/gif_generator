require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
test "registered user can login" do
  login_user!
end

test "view rerenders when params are incorrect" do
    visit new_user_path
    fill_in "Username", with: "matt"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content?("Welcome, matt")
    visit login_path

    fill_in "Username", with: "Jonny"
    fill_in "Password", with: "password"
    click_button "Login"

    assert_equal login_path, current_path
    assert page.has_content?("Invalid")
  end
end
