class Partnership < ActiveRecord::Base
  has_many :my_projects
  has_many :students, through: :my_projects
  has_many :projects, through: :my_projects
end
