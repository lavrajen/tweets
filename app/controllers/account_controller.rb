class AccountController < ApplicationController
  # Didn't specify any rendering so will use the rails default render
  # Will look for the index.html file in the about folder in views
  def index
  end

  def update_profile_picture
    if Current.user.update(user_params)
      redirect_to account_path, notice: 'Profile picture updated successfully.'
    else
      render :index
    end
  end
  private 
  def user_params
    params.require(:user).permit(:profile_picture, :name, :email)
  end
end