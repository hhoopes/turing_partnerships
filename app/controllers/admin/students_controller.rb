class Admin::StudentsController < Admin::BaseController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      if !@student.email.empty?
        StudentMailer.welcome_email(@student).deliver_now
      end
      redirect_to admin_students_path
    else
      render :new
    end
  end

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to admin_students_path
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to admin_students_path
  end

  private

  def student_params
    params.require(:student).permit(:username, :password, :name, :cohort, :email)
  end
end
