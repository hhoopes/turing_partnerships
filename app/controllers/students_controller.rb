class StudentsController <ApplicationController
  def show
    @student = Student.find(params[:id])
  end

  def index
    @students = Student.all
  end

  def edit
    if params[:id].to_i != current_user.id
      render file: 'public/404'
    else
      @student = Student.find(params[:id])
    end
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to student_path(@student)
  end

  private

  def student_params
    params.require(:student).permit(:password, :cohort)
  end

end
