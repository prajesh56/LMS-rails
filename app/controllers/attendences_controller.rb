class AttendencesController < ApplicationController
  def show
		@attendences = Attendence.where(employee_id: session[:employee_id])
	end

	def create
		
		@attendences = Attendence.new(employee_id: session[:employee_id], date: Date.today, check_in: Time.now)
		if @attendences.save
			redirect_to dashboard_path, notice: 'Check in successful'
		end
	end
	
	def update
	
		@attendences = Attendence.find_by(date: Date.today, employee_id: session[:employee_id])
		binding.pry
		if @attendences.update(check_out: Time.now)
			redirect_to dashboard_path, notice: 'Check out successful'
		end
	end
end
