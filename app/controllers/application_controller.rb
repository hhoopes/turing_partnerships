class ApplicationController < ActionController::Base
  helper_method :current_admin?, :current_user

  protect_from_forgery with: :exception

  def current_admin?
    current_user && current_user.admin?
  end

  def current_user 
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end
end
