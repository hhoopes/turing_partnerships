class Student < ActiveRecord::Base
  has_secure_password

  has_many :my_projects
  has_many :projects, through: :my_projects
  has_many :partnerships, through: :my_projects

  enum role: %w(default admin)
end
