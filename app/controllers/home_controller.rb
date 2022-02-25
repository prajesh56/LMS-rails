class HomeController < ApplicationController
	def dashboard
		if session[:employee_id]
			@user = Employee.find(session[:employee_id])
			if @user.role == 'admin'
				@employees = Employee.where.not(id: @user.id)
			end
		end
	end
	def create
		@employee = Employee.find_by(email: params[:email])
      if @employee.present? && @employee.password == params[:password]
          session[:employee_id] = @employee.id
          redirect_to '/dashboard', notice: "logged in sucessfully"
      else
          flash[:notice]= "invalid email or password"
          redirect_to root_path
      end
	end

	def destroy
		session[:employee_id] = nil
		redirect_to root_path, notice: "logged out"
	end
end