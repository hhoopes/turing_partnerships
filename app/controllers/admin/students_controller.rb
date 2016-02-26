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

    def show
      @student = Student.find(params[:id])
    end

    def destroy
      @Student.find(params[:id])
      @student.destroy
      redirect_to admin_students_path
    end
  end

  private

  def student_params
    params.require(:student).permit(:username, :password, :name, :cohort)
  end
end
