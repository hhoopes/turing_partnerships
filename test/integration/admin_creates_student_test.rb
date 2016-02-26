require 'test_helper'

class AdminCreatesStudentTest < ActionDispatch::IntegrationTest
  test "admin creates a student" do
    admin = Student.create(username: "heidi", password: "password", role: 1, name: "Heidi", cohort: "1511")

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit new_admin_student_path

    fill_in "Username", with: "adrienne"
    fill_in "Password", with: "password"
    fill_in "Name", with: "Adrienne"
    fill_in "Cohort", with: "1511"
    click_on "Create Student"

    assert page.has_content?("adrienne")
    assert page.has_content?("Adrienne")
    assert page.has_content?("1511")
  end

  test "non-admin sees error page" do
    student = Student.create(username: "heidi", password: "password", name: "Heidi", cohort: "1511")

    ApplicationController.any_instance.stubs(:current_user).returns(student)

    visit new_admin_student_path

    assert page.has_content?("The page you were looking for doesn't exist")
  end
end
