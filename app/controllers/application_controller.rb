class ApplicationController < ActionController::Base
  def current_user
    return unless session[:employee_id]
    @current_user ||= Employee.find(session[:employee_id])
  end
end
