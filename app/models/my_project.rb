class MyProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :student
  belongs_to :partnership

  validates :project_id, presence: true
  validates :student_id, presence: true

  def self.add_partnerships(my_project_params, my_project, all_students)
    ActiveRecord::Base.transaction do
      partnership = Partnership.create
      partnership.my_projects << my_project
      all_students.each do |partner|
        partner_student = Student.find(partner)
        matching_project = partner_student.my_projects.find_by(project_id: my_project.id)
        if !matching_project
          matching_project = partner_student.my_projects.create(my_project_params)
        end
        partnership.my_projects << matching_project
      end
    end
  end
end
