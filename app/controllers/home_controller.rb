class HomeController < ApplicationController
	def dashboard
		
	end
	
	def users_list
		@users = User.where.not(id: current_user.id)
	end

	def create
		@employee = Employee.find_by(email: params[:email])
		if @employee.present? && @employee.password == params[:password]
		  session[:employee_id] = @employee.id
			session[:employee_name] = @employee.name 
			session[:employee_role] = @employee.role 
		  redirect_to '/dashboard', notice: "logged in sucessfully"
		else
		  flash[:notice]= "invalid email or password"
		  redirect_to root_path
		end
	end

	
end