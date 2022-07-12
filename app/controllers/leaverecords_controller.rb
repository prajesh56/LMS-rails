class LeaverecordsController < ApplicationController
	#before_action :authenticate_user!
	before_action :verify_access, only: [:edit, :update]
  def index
		@leaverecords = Leaverecord.all.order(created_at: :desc)
	end

	def new
		@leaverecords = Leaverecord.new
		@user_options = User.select(:name).where(role: 'admin').map{ |u| [ u.name ] }
		#binding.pry
	end

	def show
		@leaverecords = Leaverecord.where(user_id: params[:id]).order(created_at: :desc)
	end

	def edit
		@leaverecords = Leaverecord.find(params[:id])
	end

	def update
		@leaverecords = Leaverecord.find(params[:id])
	  if @leaverecords.update(edit_leaverecord_params)
      redirect_to leaverecords_path, notice: 'Leave request updated.'
    else
      render :edit, status: :unprocessable_entity
    end
	end

	def create
		@leaverecords = Leaverecord.new(new_leaverecord_params)
		if @leaverecords.save
			UsersMailer.with(leave: @leaverecords).leaverequest_email.deliver_now
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
	
	def verify_access
		if current_user.role != 'admin'
			redirect_to dashboard_path, alert: "Unauthorized access"
		end
	end

	
end
