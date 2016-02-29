require 'test_helper'

class UserLogsOutTest < ActionDispatch::IntegrationTest
  test "user logs out" do
    user = Student.create(username: "heidi", password: "password", name: "Heidi", cohort: "1511")

    visit '/login'
    fill_in "Username", with: "heidi"
    fill_in "Password", with: "password"
    within("form")  do
      click_on "Log In"
    end
    assert page.has_content?("Welcome, Heidi")

    click_on "Log Out"

    refute page.has_content?("Welcome, Heidi")
  end

end
