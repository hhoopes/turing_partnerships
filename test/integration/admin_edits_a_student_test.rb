require 'test_helper'

class AdminEditsAStudentTest < ActionDispatch::IntegrationTest

  test "admin edits a student" do
    admin = Student.create(username: "heidi", password: "password", role: 1, name: "Heidi", cohort: "1511")
    student = Student.create(username: "adrienne", password: "password", name: "Adrienne", cohort: "1511")

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    # visit new_admin_student_path
    #
    # fill_in "Username", with: "adrienne"
    # fill_in "Password", with: "password"
    # fill_in "Name", with: "Adrienne"
    # fill_in "Cohort", with: "1511"
    # click_on "Create Student"
    #
    # student = Student.last

    visit admin_student_path(student)

    click_on "Edit"

    fill_in "Username", with: "adriennenew"
    fill_in "Password", with: "password"
    fill_in "Name", with: "AdrienneD"
    fill_in "Cohort", with: "1602"
    click_on "Update Student"

    assert page.has_content?("adriennenew")
    assert page.has_content?("AdrienneD")
    assert page.has_content?("1602")
  end

end
