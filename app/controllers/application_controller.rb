class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def user_root_path
    dashboard_url
  end
  #def after_sign_in_path_for(resource)
   # stored_location_for(resource) || dashboard_path
  #end
 
end
