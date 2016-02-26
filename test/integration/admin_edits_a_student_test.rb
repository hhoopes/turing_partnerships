require 'test_helper'

class AdminEditsAStudentTest < ActionDispatch::IntegrationTest

  test "admin edits a student" do
    skip
    admin = Student.create(username: "heidi", password: "password", role: 1, name: "Heidi", cohort: "1511")
    student = Student.create(username: "adrienne", password: "password", name: "Adrienne", cohort: "1511")

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_student_path(student)

    click_on "Edit"

    fill_in "Username", with: "adriennenew"
    fill_in "Password", with: "password"
    fill_in "Name", with: "AdrienneD"
    fill_in "Cohort", with: "1602"
    click_on "Edit Student"

    assert page.has_content?("adriennenew")
    assert page.has_content?("AdrienneD")
    assert page.has_content?("1602")
  end

end
