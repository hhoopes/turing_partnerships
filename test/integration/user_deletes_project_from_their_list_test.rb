require 'test_helper'

class UserDeletesProjectFromTheirListTest < ActionDispatch::IntegrationTest

  test "user can delete a project from their my_projects" do
    student = Student.create(username: "adrienne", password: "password", name: "Adrienne", cohort: "1511")

    project = Project.create(name: "Rails Mini Project", module: "2")
    student.my_projects.create(project_id: project.id)
    ApplicationController.any_instance.stubs(:current_user).returns(student)

    visit student_path(student)
    assert page.has_content?("Rails Mini Project")
    # save_and_open_page
    click_on "Delete"

    refute page.has_content?("Rails Mini Project")
  end
end
