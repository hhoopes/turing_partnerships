class Project < ActiveRecord::Base
  has_many :my_projects
  has_many :students, through: :my_projects
  has_many :partnerships, through: :my_projects

  validates :name, presence: true
  validates :module, presence: true
end
