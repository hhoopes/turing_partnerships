require 'test_helper'

class AdminEditsAProjectTest < ActionDispatch::IntegrationTest

  test "admin edits a project" do
    admin = Student.create(username: "heidi", password: "password", role: 1, name: "Heidi", cohort: "1511")

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit edit_admin_project_path

    fill_in "Name", with: "Rush Hour"
    fill_in "Module", with: "2"
    click_on "Edit Project"

    assert_equal admin_projects_path, current_path
    assert page.has_content?("Rush Hour")
    assert page.has_content?("2")
  end

end
