require 'test_helper'

class UserLogsOutTest < ActionDispatch::IntegrationTest
  test "user logs out" do
    skip
    user = Student.create(username: "heidi", password: "password", name: "Heidi", cohort: "1511")

    visit '/'
    click_on "Log In"
    fill_in "Username", with: "heidi"
    fill_in "Password", with: "password"
    click_on "Log In"

    assert page.has_content?("Welcome, Heidi")

    click_on "Log Out"

    assert page.has_content?("Welcome, Heidi")
  end

end
