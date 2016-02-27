require 'test_helper'

class PartnershipTest < ActiveSupport::TestCase
  should have_many(:my_projects)
  should have_many(:students).through(:my_projects)
  should have_many(:projects).through(:my_projects)
end
