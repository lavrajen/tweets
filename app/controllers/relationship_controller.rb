class RelationshipController < ApplicationController

  # def new
  #   @relationship = Relationship.new(Current.user, rel_params)
  # end

  # private
  # def rel_params
  #   params.require(:user).permit(:user_id)
  # end

  def new
    puts "User ID from params: #{params[:user_id]}"
    @user = params[:user_id]
    unless Relationship.exists?(follower: Current.user, followee: User.find(params[:user_id]))
      @relationship = Relationship.create(follower: Current.user, followee: User.find(params[:user_id]))
      @relationship.save
    end
    #@relationship = Relationship.create_or_find_by(follower: Current.user, followee: @user)
    #@relationship = Relationship.new(follower: Current.user,followee: @user)
    # Current.user.follow(@user)relationship = Relationship.find_or_create_by(follower: Current.user, followed: @user)
    
    # respond_to do |format|
    #   format.js
    # end
  end

end


