class AccountController < ApplicationController
  # Didn't specify any rendering so will use the rails default render
  # Will look for the index.html file in the about folder in views
  def index
    @user = Current.user
  end

  def update_profile_picture
    @user = Current.user
    puts "Here"

    @user.assign_attributes(user_params)
    if @user.save

      redirect_to account_path, notice: 'Profile picture updated successfully.'

    else
      render :index
      flash[:alert] = 'Failed to update profile picture.'
    end
  end
  
  private 
  def user_params
    user_params = params.require(:user).permit(:profile_picture)
    user_params
  end
end