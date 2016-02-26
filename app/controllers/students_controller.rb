require 'test_helper'

class StudentsController <ApplicationController
  def show
    @student = current_user
  end

  def index
  end

end
