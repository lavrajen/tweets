class MainController < ApplicationController
  def index
    # flash.now[:notice] = "Logged in successfully"
    # flash.now[:alert] = "Invalid email or password"
      # where(user: Current.user.following) -- add this when we have a follow feature
      @alltweets = Tweet.order(created_at: :desc)
      #@allusers = @user.followees
    if session[:user_id]
      # using find_by instead of find means that the rails app will not crash when the user can't be found
      @user = User.find_by(id: session[:user_id])
      @allusers = User.all
      @alltweets = Tweet.where(user: @user.followees).order(created_at: :desc)
    end
    if Current.user.present?
      # Logic for when a user is logged in
      @followees = Current.user.followees
      @users_not_followed = User.where.not(id: @followees).where.not(id: @user)
    else
      # When no user is logged in, show all users
      @users_not_followed = User.all
    end
  
    # @allusers = User.all
    # @followees = @user.followees
    # @users_not_followed = User.where.not(id: @followees).where.not(id: @user)
    # @alltweets = Tweet.where(user: @user.followees).order(created_at: :desc)

  end
end