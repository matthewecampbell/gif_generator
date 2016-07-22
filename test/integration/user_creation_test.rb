require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  test "a user can be created" do
    visit new_user_path
    fill_in "Username", with: "matt"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content?("Welcome, matt")
  end

  test "a username cannot be duplicated" do
    visit new_user_path
    fill_in "Username", with: "matt"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content?("Welcome, matt")

    visit new_user_path
    fill_in "Username", with: "matt"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content?("Invalid")
  end

  test "guest can't register without username" do
   visit new_user_path

   fill_in "Password", with: "password"
   click_button "Create Account"
   assert page.has_content?("Invalid")
 end

 test "guest can't register without password" do
   visit new_user_path

   fill_in "Username", with: "chocolate"
   click_button "Create Account"

   assert page.has_content?("Invalid")
 end
end
