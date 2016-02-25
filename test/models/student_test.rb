require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  should have_many(:student_projects)
  should have_many(:projects).through(:student_projects)
  should have_many(:partnerships).through(:student_projects)
end
