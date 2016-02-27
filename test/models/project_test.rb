require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  should have_many(:my_projects)
  should have_many(:students).through(:my_projects)
  should have_many(:partnerships).through(:my_projects)
end
