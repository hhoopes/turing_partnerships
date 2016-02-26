require 'test_helper'

class AdminCreatesAProjectTest < ActionDispatch::IntegrationTest

  test "admin creates a project" do
    admin = Student.create(username: "heidi", password: "password", role: 1, name: "Heidi", cohort: "1511")

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit new_admin_project_path

    fill_in "Name", with: "Rails Mini Project"
    fill_in "Module", with: "2"
    click_on "Create Project"

    assert page.has_content?("Rails Mini Project")
    assert page.has_content?("2")
  end

end
