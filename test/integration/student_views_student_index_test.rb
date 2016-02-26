require 'test_helper'

class StudentViewsIndexTest < ActionDispatch::IntegrationTest
  test "student views index of all students" do
    student = Student.create(username: "adrienne", password: "password", name: "Adrienne", cohort: "1511")
    student2 = Student.create(username: "heidi", password: "password", name: "Heidi", cohort: "1511")

    ApplicationController.any_instance.stubs(:current_user).returns(student)

    visit students_path

    assert page.has_content?("All Students")
    assert page.has_content?("Adrienne")
    assert page.has_content?("Heidi")
  end
end
