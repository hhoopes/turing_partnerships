class MyProjectsController < ApplicationController

  def new
    @student = Student.find(params[:student_id])
    @my_project = MyProject.new
  end

  def create
    @student = Student.find(params[:student_id])
    @student.my_projects.create(my_project_params)
    redirect_to student_path(@student)
  end

  def destroy
    @student = Student.find(params[:student_id])
    MyProject.find_by(student_id: @student.id, project_id: params[:id]).destroy
    redirect_to student_path(@student)
  end

  private

  def my_project_params
    params.require(:project).permit(:project_id)
  end
end
