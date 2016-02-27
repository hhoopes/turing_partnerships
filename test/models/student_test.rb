require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  should have_many(:my_projects)
  should have_many(:projects).through(:my_projects)
  should have_many(:partnerships).through(:my_projects)
  should validate_presence_of(:name).on(:create)
  should validate_presence_of(:username).on(:create)
  should validate_presence_of(:password_digest).on(:create)
  should validate_presence_of(:cohort).on(:create)

end
