class MyProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :student
  belongs_to :partnership

  def self.add_partnerships(student, my_project_params, my_project, all_students)
    my_project.update(partnership_id: Partnership.create.id)
    all_students.each do |partner|
      partner_student = Student.find(partner)
      matching_project = partner_student.my_projects.where(project_id: student.my_projects.last.project_id)
      if !matching_project.last
        matching_project << partner_student.my_projects.create(my_project_params)
      end
      matching_project.last.update(partnership_id: Partnership.last.id)
    end
  end
end
