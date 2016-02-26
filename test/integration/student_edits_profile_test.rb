require 'test_helper'

class StudentEditsProfileTest < ActionDispatch::IntegrationTest

  test "student can log in with new password" do
    student1 = Student.create(username: "adrienne", password: "password", name: "Adrienne", cohort: "1511")
    student2 = Student.create(username: "heidi", password: "password", name: "Heidi", cohort: "1511")

    ApplicationController.any_instance.stubs(:current_user).returns(student1)

    visit student_path(student1)
    click_on "Edit Profile"
    fill_in "Password", with: "newpassword"
    fill_in "Cohort", with: "1602"
    click_on "Update Student"

    visit students_path
    save_and_open_page
    assert page.has_content?("1602")
  end
end
