class Student < ActiveRecord::Base
  has_secure_password

  has_many :my_projects
  has_many :projects, through: :my_projects
  has_many :partnerships, through: :my_projects

  validates :name, presence: true
  validates :cohort, presence: true
  validates :username, presence: true
  validates :password_digest, presence: true

  enum role: %w(default admin)

  def paired
    my_projects.map do |project|
      MyProject.where(partnership_id: project.partnership_id).map do |partner_project|
        partner_project.student.name
      end
    end.flatten.uniq.delete_if { |name| name == self.name }
  end

  def unpaired
    Student.all.select do |student|
      !paired.include?(student.name)
    end.map do |non_pair|
      non_pair.name
    end.delete_if { |name| name == self.name }
  end
end
