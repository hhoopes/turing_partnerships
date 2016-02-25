require 'test_helper'

class StudentProjectTest < ActiveSupport::TestCase
  should belong_to(:student)
  should belong_to(:project)
  should belong_to(:partnership)
end
