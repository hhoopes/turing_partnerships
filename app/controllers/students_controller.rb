class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update]

  def show
  end

  def index
    @students = Student.all
  end

  def edit
    render file: 'public/404' if params[:id].to_i != current_user.id
  end

  def update
    @student.update(student_params)
    if @student.save
      flash.notice = "Successfully updated your profile"
      redirect_to student_path(@student)
    else
      flash.alert = "#{@student.errors.full_messages.join(", ")}"
      render :new
    end
  end

  private

  def student_params
    params.require(:student).permit(:password, :cohort)
  end

  def find_student
    @student = Student.find(params[:id])
  end

end
