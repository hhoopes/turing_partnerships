class Project < ActiveRecord::Base
  has_many :student_projects
  has_many :students, through: :student_projects
  has_many :partnerships, through: :student_projects
end
