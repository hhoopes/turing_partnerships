require 'test_helper'

class AdminDeletesAStudentTest < ActionDispatch::IntegrationTest
  test "admin edits a student" do
    admin = Student.create(username: "heidi", password: "password", role: 1, name: "Heidi", cohort: "1511")
    student = Student.create(username: "adrienne", password: "password", name: "Adrienne", cohort: "1511")

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_student_path(student)
    click_on "Delete"

    asssert_equal admin_students_path, current_path
    refute page.has_content?("Adrienne")
  end
end
