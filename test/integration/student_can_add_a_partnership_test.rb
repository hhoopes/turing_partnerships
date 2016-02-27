require 'test_helper'

class StudentCanAddPartnershipTest < ActionDispatch::IntegrationTest

  test 'student can add a partner who already has that project' do
    student_1 = Student.create(username: "adrienne", password: "password", name: "Adrienne", cohort: "1511")
    student_2 = Student.create(username: "heidi", password: "password", name: "Heidi", cohort: '1511')

    project = Project.create(name: "Rails Mini Project", module: "2")
    student_1.my_projects.create(project_id: project.id.to_s)

    ApplicationController.any_instance.stubs(:current_user).returns(student_2)
    visit student_path(student_2)
    click_on "Add a Project to Your List"
# save_and_open_page
    select "Rails Mini Project"
    check student_1.id
    click_on "Add to My List!"
    my_project = MyProject.last
    visit student_my_project_path(student_2, my_project)
# save_and_open_page
    assert page.has_content?("Adrienne")
    assert page.has_content?("Rails Mini Project")
  end
end
