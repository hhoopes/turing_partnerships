require 'test_helper'

class UserLogsInTest < ActionDispatch::IntegrationTest

  test "user logs in" do
    skip
    user = Student.create(username: "heidi", password: "password", name: "Heidi", cohort: "1511")

    visit '/'
    click_on "Log In"
    fill_in "Username", with: "heidi"
    fill_in "Password", with: "password"
    click_on "Log In"

    assert page.has_content?("Welcome, Heidi")
  end
end
