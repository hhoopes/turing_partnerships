require 'test_helper'

class StudentCanAddPartnershipTest < ActionDispatch::IntegrationTest

  test 'student can add a single partner who already has that project' do
    student_1 = Student.create(username: "adrienne", password: "password", name: "Adrienne", cohort: "1511")
    student_2 = Student.create(username: "heidi", password: "password", name: "Heidi", cohort: '1511')

    project = Project.create(name: "Rails Mini Project", module: "2")
    student_1.my_projects.create(project_id: project.id.to_s)

    ApplicationController.any_instance.stubs(:current_user).returns(student_2)
    visit student_path(student_2)
    click_on "Add a Project to Your List"

    select "Rails Mini Project"
    check student_1.id
    click_on "Add to My List!"
    my_project = MyProject.last
    visit student_my_project_path(student_2, my_project)

    assert page.has_content?("Adrienne")
    assert page.has_content?("Rails Mini Project")
  end

  test "student adds multiple partners out of a bigger pool of students" do
    student_1 = Student.create(username: "adrienne", password: "password", name: "Adrienne", cohort: "1511")
    student_2 = Student.create(username: "heidi", password: "password", name: "Heidi", cohort: '1511')
    student_3 = Student.create(username: "erinna", password: "password", name: "Erinna", cohort: '1511')
    student_4 = Student.create(username: "justin", password: "password", name: "Justin", cohort: '1511')

    project = Project.create(name: "Rails Mini Project", module: "2")
    student_2.my_projects.create(project_id: project.id.to_s)
    student_3.my_projects.create(project_id: project.id.to_s)
    student_4.my_projects.create(project_id: project.id.to_s)

    ApplicationController.any_instance.stubs(:current_user).returns(student_1)
    visit student_path(student_1)
    click_on "Add a Project to Your List"

    select "Rails Mini Project"
    check student_2.id
    check student_3.id
    click_on "Add to My List!"
    my_project = MyProject.last
    visit student_my_project_path(student_1, my_project)

    assert page.has_content?("Heidi")
    assert page.has_content?("Erinna")
    assert page.has_content?("Rails Mini Project")
  end

  test "student adds multiple partners who haven't added project" do
    student_1 = Student.create(username: "adrienne", password: "password", name: "Adrienne", cohort: "1511")
    student_2 = Student.create(username: "heidi", password: "password", name: "Heidi", cohort: '1511')
    Student.create(username: "erinna", password: "password", name: "Erinna", cohort: '1511')
    Student.create(username: "justin", password: "password", name: "Justin", cohort: '1511')

    project = Project.create(name: "Rails Mini Project", module: "2")

    ApplicationController.any_instance.stubs(:current_user).returns(student_1)
    visit student_path(student_1)
    click_on "Add a Project to Your List"

    select "Rails Mini Project"
    check student_2.id
    click_on "Add to My List!"
    my_project = MyProject.last
    visit student_my_project_path(student_1, my_project)

    assert page.has_content?("Heidi")
    assert page.has_content?("Rails Mini Project")
  end

  test "student adds multiple partners and view opposite student" do
    student_1 = Student.create(username: "adrienne", password: "password", name: "Adrienne", cohort: "1511")
    student_2 = Student.create(username: "heidi", password: "password", name: "Heidi", cohort: '1511')
    Student.create(username: "erinna", password: "password", name: "Erinna", cohort: '1511')
    Student.create(username: "justin", password: "password", name: "Justin", cohort: '1511')

    project = Project.create(name: "Rails Mini Project", module: "2")

    ApplicationController.any_instance.stubs(:current_user).returns(student_1)
    visit student_path(student_1)
    click_on "Add a Project to Your List"

    select "Rails Mini Project"
    check student_2.id
    click_on "Add to My List!"
    my_project = MyProject.last
    visit student_my_project_path(student_2, student_2.my_projects.last)

    assert page.has_content?("Adrienne")
    assert page.has_content?("Rails Mini Project")
  end
end
