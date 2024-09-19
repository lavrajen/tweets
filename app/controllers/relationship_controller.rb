class RelationshipController < ApplicationController
  before_action :require_user_logged_in!
  def new
    @user = params[:user_id]
    unless Relationship.exists?(follower: Current.user, followee: User.find(params[:user_id]))
      @relationship = Relationship.create(follower: Current.user, followee: User.find(params[:user_id]))
      @relationship.save
    end
  end

  def delete
    @relationship = Relationship.find_by(follower: Current.user, followee: User.find(params[:user_id]))
    @relationship.destroy
  end

end


