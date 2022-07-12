# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :configure_permitted_parameters, only: [:create]

 

  # GET /resource/sign_up
  #def new
  #  @user = User.new
  #end

  # POST /resource
  def create
    #binding.pry
    @user = User.new(user_params)
    if @user.save
      UsersMailer.with(user: @user).welcome_email.deliver_now
      redirect_to new_user_session_path
    end
  end

  # GET /resource/edit
  def edit
    @user = User.find(current_user.id)
  end

  # PUT /resource
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to dashboard_path, notice: "User Updated."
    else
      redirect_to dashboard_path, alert: "No change(s) were made."
    end
  end

  # DELETE /resource
    def destroy
      @user = User.find(params[:format])
      if @user.destroy
        redirect_to users_path, notice: "User deleted."
      else
        redirect_to users_path, flash: { error: "User could not be deleted." }
      end
    end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :avatar, :role, :start_date, :contact, :address, :password, :password_confirmation, :confirmed_at)
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: %i[name address contact role start_date avatar]
    )
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: %i[name email avatar contact address])
   end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
