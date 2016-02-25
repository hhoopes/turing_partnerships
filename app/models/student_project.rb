class StudentProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :student
  belongs_to :partnership
end
