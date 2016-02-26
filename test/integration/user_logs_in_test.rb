require 'test_helper'

class UserLogsInTest < ActionDispatch::IntegrationTest

  test "user logs in" do
    user = Student.create(username: "heidi", password: "password", name: "Heidi", cohort: "1511")

    visit '/login'
    fill_in "Username", with: "heidi"
    fill_in "Password", with: "password"

    click_on "Log In"
    # ApplicationController.any_instance.stubs(:current_user).returns(:current_user)
    assert_equal student_path(user), current_path
    assert page.has_content?("Welcome, Heidi")
  end
end
