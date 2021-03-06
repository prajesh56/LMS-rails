class AttendencesController < ApplicationController
	#before_action :authenticate_user!
  def show
		@attendences = Attendence.where(user_id: current_user.id).order(created_at: :desc)
	end

	def create
		if Attendence.find_by(date: Date.today, user_id: current_user.id)
			redirect_to dashboard_path, notice: 'Check in already tracked'
		else
		@attendences = Attendence.new(user_id: current_user.id, date: Date.today)
			if @attendences.save
				redirect_to dashboard_path, notice: 'Check in successful'
			end
		end
	end
	
	def update
		#binding.pry
		@attendences = Attendence.find_by(user_id: params[:id], date: Date.today)
		#binding.pry
		if @attendences.duration
			redirect_to dashboard_path, notice: 'Check out already performed'
		else
			if @attendences.update(duration: total_duration)
				redirect_to dashboard_path, notice: 'Check out successful'
			end
		end
	end
	private
	#def edit_leaverecord_params
	#	params.require(:attendence).permit(:id)
	#end
	
	def total_duration
		started_at = @attendences.created_at
		now_time = Time.now - started_at
		duration_hr = 0
		duration_min = 0
		duration_min = (now_time/1.minute).round
		if duration_min > 60
			duration_hr = (now_time/1.hour).round
			now_time = now_time - duration * 60
			duration_min = (now_time/1.minute).round
		end
		total_duration = duration_hr.to_s+" hr "+duration_min.to_s+" min "
		
	end
	
end
