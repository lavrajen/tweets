
# This is the parent controller of all the other controllers in this code base
class ApplicationController < ActionController::Base

  # This means that this is the  first thing that occurs before all the actions
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: "You must be signed in to do that." if Current.user.nil? end
end
