class EmployeesController < ApplicationController
  def new
		
		@employees = Employee.new
	end

	def edit
		@employees = Employee.find(params[:id])
	end

	def update
    @employees = Employee.find(params[:id])
    if @employees.update(employee_params)
      redirect_to dashboard_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

	def create
		#binding.pry
    @employees = Employee.new(employee_params)
		if @employees.save
			redirect_to dashboard_path, notice: "Employee created successfully" 
		end
  end

	def destroy
    employees = Employee.find(params[:id])
    employees.destroy
    redirect_to dashboard_path
  end

	private
	def employee_params
		params.require(:employee).permit(:id, :name, :address, :contact, :start_date, :role, :email, :password)
	end
end
