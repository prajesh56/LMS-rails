class HomeController < ApplicationController
	
	before_action :authenticate_user!, :except => [:index]
	def index
		if user_signed_in?
			redirect_to dashboard_path
		end
	end

	def profile
		#current_user_profile_page
	end

	def users_list
		@users = User.where.not(id: current_user.id).order(created_at: :desc)
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