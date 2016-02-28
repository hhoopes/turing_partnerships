require 'test_helper'

class StudentViewsOwnProfileTest < ActionDispatch::IntegrationTest
  test "student views own profile view" do
    student1 = Student.create(username: "adrienne", password: "password", name: "Adrienne", cohort: "1511")
    student2 = Student.create(username: "heidi", password: "password", name: "Heidi", cohort: "1511")

    ApplicationController.any_instance.stubs(:current_user).returns(student1)

    visit student_path(student1)

    assert page.has_content?("Your Profile")
    assert page.has_content?("Adrienne")
  end

  test "student views another student's profile without edit links" do
    student1 = Student.create(username: "adrienne", password: "password", name: "Adrienne", cohort: "1511")
    student2 = Student.create(username: "heidi", password: "password", name: "Heidi", cohort: "1511")

    ApplicationController.any_instance.stubs(:current_user).returns(student1)

    visit student_path(student2)

    refute page.has_content?("Edit Profile")
  end

  test "student sees lists of peers they have worked with and those they haven't" do
    student1 = Student.create(username: "adrienne", password: "password", name: "Adrienne", cohort: "1511")
    student2 = Student.create(username: "heidi", password: "password", name: "Heidi", cohort: "1511")
    student3 = Student.create(username: "chad", password: "password", name: "Chad", cohort: "1511")
    student4 = Student.create(username: "brennan", password: "password", name: "Brennan", cohort: "1511")
    student5 = Student.create(username: "erinna", password: "password", name: "Erinna", cohort: "1511")

    p1 = Partnership.create
    p2 = Partnership.create

    project = Project.create(name: "Rails Mini Project", module: "2")
    project2 = Project.create(name: "Little Shop", module: "2")

    MyProject.create(student_id: student1.id, project_id: project.id, partnership_id: p1.id)
    MyProject.create(student_id: student3.id, project_id: project.id, partnership_id: p1.id)
    MyProject.create(student_id: student4.id, project_id: project.id, partnership_id: p1.id)
    MyProject.create(student_id: student1.id, project_id: project2.id, partnership_id: p2.id)
    MyProject.create(student_id: student5.id, project_id: project2.id, partnership_id: p2.id)

    ApplicationController.any_instance.stubs(:current_user).returns(student1)

    visit student_path(student1)
    within(".paired") do
      assert page.has_content?("#{student3.name}")
      assert page.has_content?("#{student4.name}")
      assert page.has_content?("#{student5.name}")
    end

    within(".unpaired") do
      assert page.has_content?("#{student2.name}")
    end

  end
end
