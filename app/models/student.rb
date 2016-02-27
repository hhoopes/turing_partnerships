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
end
