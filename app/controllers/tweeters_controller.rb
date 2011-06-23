class TweetersController < ApplicationController
  def index
    @tweeters = Tweeter.all
  end

  def new 
    @tweeter = Tweeter.new
  end
  
  def create
    @tweeter = Tweeter.create(:screen_name => 
    params[:tweeter][:screen_name])
    redirect_to tweeters_path
  end

end
