require 'test_helper'

class SessionsController < ApplicationController
  def new
  end

  def create
    @student = Student.find_by(username: params[:session][:username])
    if @student && @student.authenticate(params[:session][:password])
      session[:user_id] = @student.id
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
