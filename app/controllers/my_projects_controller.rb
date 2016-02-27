class MyProjectsController < ApplicationController

  def new
    @student = Student.find(params[:student_id])
    @my_project = MyProject.new
  end

  def create
    @student = Student.find(params[:student_id])
    my_project = @student.my_projects.create(my_project_params)
    my_project.partnership = Partnership.create
    new_partnership_id = Partnership.last
    partner_students[:partnership].each do |partner|
      student = Student.find(partner)
      matching_project = student.my_projects.where(project_id: @student.my_projects.last.project_id)
      matching_project.last.update(partnership_id: new_partnership_id.id)
    end
    redirect_to student_path(@student)
  end

  def show
    @my_project = MyProject.find(params[:id])
    @student = Student.find(params[:student_id])
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

  def partner_students
    params.require(:project).permit(partnership: [])
  end
end
