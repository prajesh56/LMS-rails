class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters
  def invite_resource
    User.invite!(invite_params)
  end

  def accept_resource
    resource = resource_class.accept_invitation!(update_resource_params)
    resource
  end  

  def invite_params
    params.require(:user).permit(:email, :invitation_token, :role, :name, :password, :password_confirmation)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, :address, :contact, :avatar, :start_date])
  end
end