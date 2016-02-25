class Partnership < ActiveRecord::Base
  has_many :student_projects
  has_many :students, through: :student_projects
  has_many :projects, through: :student_projects
end
