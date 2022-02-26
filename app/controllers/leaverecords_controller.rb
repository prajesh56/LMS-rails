class LeaverecordsController < ApplicationController
  def new
		@leaverecords = Leaverecord.new
	end

	def create
		@leaverecords = Leaverecord.new(leaverecord_params)
		if @leaverecords.save
			redirect_to dashboard_path, notice: "New Leave request created successfully" 
		else
			render :new
		end
	end

	private
	def leaverecord_params
		binding.pry
		params.permit(:date_from, :date_to, :description, :status, :employee_id, :approval_by)
	end
end
