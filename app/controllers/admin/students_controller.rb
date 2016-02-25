class Admin::StudentsController < Admin::BaseController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to admin_students_path
    else
      render :new
    end

    def index
      @students = Student.all
    end

  end

  private

  def student_params
    params.require(:student).permit(:username, :password, :name, :cohort)
  end
end
