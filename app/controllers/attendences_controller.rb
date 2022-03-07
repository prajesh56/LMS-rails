class AttendencesController < ApplicationController
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
		@attendences = Attendence.find_by(user_id: params[:id])
		#binding.pry
		if @attendences.update(duration: Time.now)
			
			redirect_to dashboard_path, notice: 'Check out successful'
		end
	end
	private
	#def edit_leaverecord_params
	#	params.require(:attendence).permit(:id)
	#end
	def duration_total(ci)
		
		t = Time.now

	 t.strftime("%I:%M%p")-ci.strftime("%I:%M%p")

	end
	
end
