class TweetersController < ApplicationController
  def index
    @tweeters = Tweeter.all
  end

  def new 
    @tweeter = Tweeter.new
  end

end
