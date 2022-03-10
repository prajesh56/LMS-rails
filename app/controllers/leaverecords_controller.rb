class LeaverecordsController < ApplicationController
	#before_action :authenticate_user!
  def index
		#@leaverecords = Leaverecord.where.not(employee_id: session[:employee_id])
		@leaverecords = Leaverecord.all.order(created_at: :desc)
	
	end

	def new
		@leaverecords = Leaverecord.new
		#@admins = User.select(:name).where(role: 'admin')
		@user_options = User.select(:name).where(role: 'admin').where.not(email: current_user.email).map{ |u| [ u.name ] }
	end

	def show
		@leaverecords = Leaverecord.where(user_id: params[:id]).order(created_at: :desc)
	end

	def edit
		@leaverecords = Leaverecord.find(params[:id])
	end

	def update
		binding.pry
		@leaverecords = Leaverecord.find(params[:id])
	  if @leaverecords.update(edit_leaverecord_params)
      redirect_to leaverecords_path, notice: 'Leave request updated.'
    else
      render :edit, status: :unprocessable_entity
    end
	end

	def create
		@leaverecords = Leaverecord.new(new_leaverecord_params)
		#binding.pry
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
		params.require(:leaverecord).permit(:id, :date_from, :date_to, :description, :user_id, :status, :approval_by)
	end
	
end
