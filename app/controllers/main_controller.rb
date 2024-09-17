class MainController < ApplicationController
  def index
    # flash.now[:notice] = "Logged in successfully"
    # flash.now[:alert] = "Invalid email or password"
    if session[:user_id]
      # using find_by instead of find means that the rails app will not crash when the user can't be found
      @user = User.find_by(id: session[:user_id])
    end
  end
end