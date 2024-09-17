class PasswordResetsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      # This says to go to the Password Mailer and send the reset email but we also need the params for the user so it is also used here
      # We are using the deliver_later method to send the email as a background job so our request to the browser can happen immediately as its already ready
      # deliver_now would take a bit longer to send as it would have to wait for the email to be sent before the request can be completed
      PasswordMailer.with(user: @user).reset.deliver_now

    end

    redirect_to root_path, notice: "We have sent a password reset link to your email if an account with that email is found."
  end

  def edit
    # This is the method that will be called when the user clicks the link in the email and it will check if it can get the user from it and that it hasn't been more than 15 mins
    @user = User.find_signed!(params[:token], purpose: "password_reset")

    # This redirects the page if the token is invalid or has expired
    rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: "Your token has expired. Please try again."
  end
  
  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to sign_in_path, notice: "Your password has been updated. Please sign in."
    else
      render :edit
    end
  end

  private
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end