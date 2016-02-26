require 'test_helper'

class AdminDeletesAStudentTest < ActionDispatch::IntegrationTest
  test "admin deletes a student" do

    admin = Student.create(username: "heidi", password: "password", role: 1, name: "Heidi", cohort: "1511")
    # student = Student.create(username: "adrienne", password: "password", name: "Adrienne", cohort: "1511")
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit new_admin_student_path

    fill_in "Username", with: "adrienne"
    fill_in "Password", with: "password"
    fill_in "Name", with: "Adrienne"
    fill_in "Cohort", with: "1511"
    click_on "Create Student"

    student = Student.last

    visit admin_student_path(student)
    click_on "Delete"

    # assert_equal admin_students_path, current_path
    refute page.has_content?("Adrienne")
  end
end
