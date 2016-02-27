require 'test_helper'

class StudentAddsProjectToTheirListTest < ActionDispatch::IntegrationTest

  test "student sees project listed on show page" do
    student = Student.create(username: "adrienne", password: "password", name: "Adrienne", cohort: "1511")

    Project.create(name: "Rails Mini Project", module: "2")
    Project.create(name: "Little Shop", module: "2")

    ApplicationController.any_instance.stubs(:current_user).returns(student)

    visit student_path(student)
    click_on "Add a Project to Your List"

    select "Rails Mini Project"

    click_on "Add to My List!"

    assert page.has_content?("Rails Mini Project")
  end
end
