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

  test "non-admin cannot create projects" do
    student = Student.create(username: "heidi", password: "password", name: "Heidi", cohort: "1511")

    ApplicationController.any_instance.stubs(:current_user).returns(student)

    visit new_admin_project_path

    assert page.has_content?("The page you were looking for doesn't exist")
  end

end
