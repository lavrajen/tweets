class TweetsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_tweet, only: [:update, :edit, :destroy]
  def index
    @tweets = Current.user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Current.user.tweets.create(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: "Tweet was posted successfully."
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "Tweet was deleted successfully."
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "Tweet was updated successfully."
    else
      render :new
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end

  def set_tweet
    @tweet = Current.user.tweets.find_by(params[:id])
  end
end