require 'test_helper'

class PartnershipTest < ActiveSupport::TestCase
  should have_many(:student_projects)
  should have_many(:students).through(:student_projects)
  should have_many(:projects).through(:student_projects)
end
