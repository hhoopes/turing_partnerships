require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  should have_many(:my_projects)
  should have_many(:projects).through(:my_projects)
  should have_many(:partnerships).through(:my_projects)

  test "paired with" do

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

    assert_equal [student3.name, student4.name, student5.name], student1.paired
  end

  test "unpaired with" do

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

    assert_equal [student2.name], student1.unpaired
  end
end
