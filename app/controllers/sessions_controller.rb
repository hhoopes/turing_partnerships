class SessionsController < ApplicationController
  def new
  end

  def create
    @student = Student.find_by(username: params[:sessions][:username])
    if @student && @student.authenticate(params[:sessions][:password])
      session[:student_id] = @student.id
      flash[:notice] = "You have successfully logged in."
      redirect_to student_path(@student)
    else
      flash[:alert] = "Login failed, please try again."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You have successfully logged out."
    redirect_to login_path
  end
end
