require 'test_helper'

class MyProjectTest < ActiveSupport::TestCase
  should belong_to(:student)
  should belong_to(:project)
  should belong_to(:partnership)
  should validate_presence_of(:project_id).on(:create)
  should validate_presence_of(:student_id).on(:create)
end
