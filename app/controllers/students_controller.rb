require 'test_helper'

class StudentsController <ApplicationController
  def show
    @student = current_user
  end

  def index
    @students = Student.all
  end

end
