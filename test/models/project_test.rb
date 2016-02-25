require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  should have_many(:student_projects)
  should have_many(:students).through(:student_projects)
  should have_many(:partnerships).through(:student_projects)
end
