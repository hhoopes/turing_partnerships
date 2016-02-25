class Student < ActiveRecord::Base
  has_secure_password

  has_many :student_projects
  has_many :projects, through: :student_projects
  has_many :partnerships, through: :student_projects

  enum role: %w(default admin)
end
