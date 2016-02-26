require 'test_helper'

class AdminDeletesAProjectTest < ActionDispatch::IntegrationTest
  test "admin deletes a project" do
    admin = Student.create(username: "heidi", password: "password", role: 1, name: "Heidi", cohort: "1511")
    project = Project.new(name: "Insanely Hard Project", module: "2")

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_project_path(project)

    click_on "Delete Project"

    assert_equal admin_projects_path, current_path
    refute page.has_content?("Insanely Hard Project")
  end
end
