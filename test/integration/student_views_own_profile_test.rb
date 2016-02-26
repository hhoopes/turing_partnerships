require 'test_helper'

class StudentViewsOwnProfileTest < ActionDispatch::IntegrationTest
  test "student views own profile view" do
    student1 = Student.create(username: "adrienne", password: "password", name: "Adrienne", cohort: "1511")
    student2 = Student.create(username: "heidi", password: "password", name: "Heidi", cohort: "1511")

    ApplicationController.any_instance.stubs(:current_user).returns(student1)

    visit student_path(student1)

    assert page.has_content?("Your Profile")
    assert page.has_content?("Adrienne")
    refute page.has_content?("Heidi")
  end
end
