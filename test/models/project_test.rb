require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  should have_many(:my_projects)
  should have_many(:students).through(:my_projects)
  should have_many(:partnerships).through(:my_projects)
  should validate_presence_of(:name).on(:create)
  should validate_presence_of(:module).on(:create)

end
