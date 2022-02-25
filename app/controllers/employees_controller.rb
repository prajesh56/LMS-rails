class EmployeesController < ApplicationController
  def new
		@employee = Employee.new
	end

	def edit
		@employees =Employee.find(params[:id])
	end
	def create
		#binding.pry
    @employees = Employee.new(employee_params)
		if @employees.save
			redirect_to new_employees_path, notice: "Employee created successfully" 
		end
  end
	private
	def employee_params
		params.require(:employee).permit(:name, :address, :contact, :start_date, :role, :email, :password)
	end
end
