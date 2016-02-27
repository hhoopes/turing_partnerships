class MyProjectsController < ApplicationController
  before_action :find_student

  def new
    @my_project = MyProject.new
  end

  def create
    @my_project_params = my_project_params
    my_project = @student.my_projects.create(@my_project_params)
    if partner_students[:partnership]
      MyProject.add_partnerships(@my_project_params, my_project, partner_students[:partnership])
    end
    redirect_to student_path(@student)
  end

  def show
    @my_project = MyProject.find(params[:id])
  end

  def destroy
    MyProject.find_by(student_id: @student.id, project_id: params[:id]).destroy
    redirect_to student_path(@student)
  end

  private

  def find_student
    @student = Student.find(params[:student_id])
  end

  def my_project_params
    params.require(:project).permit(:project_id)
  end

  def partner_students
    params.require(:project).permit(partnership: [])
  end
end
