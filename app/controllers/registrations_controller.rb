class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # Render prints the parameter on the webpage
    # Can't have multiple renders so commented the line out
    # render plain: params[:user]
    # This line below just prints it in the console
    puts "#{params[:user]} here"

    @user = User.new(user_params)
    if @user.save
      # Log the user in and setting the session cookie
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully created account"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end