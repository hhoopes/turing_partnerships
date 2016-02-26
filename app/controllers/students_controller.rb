require 'test_helper'

class StudentsController <ApplicationController
  def show
    if params[:id].to_i != current_user.id
      render file: '/public/404'
    else
      @student = current_user
    end
  end

  def index
    @students = Student.all
  end

end
