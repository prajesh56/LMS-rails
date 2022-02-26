class LeaverecordsController < ApplicationController
  def index
		@leaverecords = Leaverecord.all
	end

	def new
		@leaverecords = Leaverecord.new
	end

	def edit
		@leaverecords = Leaverecord.find(params[:id])
	end

	def update
		@leaverecords = Leaverecord.find(params[:id])
	  if @leaverecords.update(leaverecord_params)
      redirect_to leaverecords_path
    else
      render :edit, status: :unprocessable_entity
    end
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
		if session[:employee_role]== 'admin'
			params.require(:leaverecord).permit(:id, :date_from, :date_to, :description, :employee_id, :status, :approval_by)
		else
			params.require(:leaverecord).permit(:id, :date_from, :date_to, :description, :employee_id, :status)
		end
	end
	
end
