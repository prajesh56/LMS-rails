class LeaverecordsController < ApplicationController
  def index
		#@leaverecords = Leaverecord.where.not(employee_id: session[:employee_id])
		@leaverecords = Leaverecord.all
	end

	def new
		@leaverecords = Leaverecord.new
	end

	def show
		@leaverecords = Leaverecord.where(employee_id: params[:id])
	end

	def edit
		@leaverecords = Leaverecord.find(params[:id])
	end

	def update
		@leaverecords = Leaverecord.find(params[:id])
	  if @leaverecords.update(edit_leaverecord_params)
      redirect_to leaverecords_path
    else
      render :edit, status: :unprocessable_entity
    end
	end

	def create
		@leaverecords = Leaverecord.new(new_leaverecord_params)
		if @leaverecords.save
			redirect_to dashboard_path, notice: "New Leave request created successfully" 
		else
			render :new, status: :unprocessable_entity
		end
	end

	def destroy
		leaverecords = Leaverecord.find(params[:id])
		leaverecords.destroy
		redirect_to dashboard_path
	end

	private
	def edit_leaverecord_params
		params.require(:leaverecord).permit(:status, :approval_by)
	end

	def new_leaverecord_params
		params.require(:leaverecord).permit(:id, :date_from, :date_to, :description, :employee_id, :status)
	end
	
end
