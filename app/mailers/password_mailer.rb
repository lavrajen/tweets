class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    # These parameters are the details that the user has submitted, an object has not yet been created so we can't use @user
    # params is a method that returns a hash like object that contains all the parameters that were passed to the controller
    @token = params[:user].signed_id(purpose: "password_reset", expires_in: 15.minutes)

    mail to: params[:user].email
  end
end
