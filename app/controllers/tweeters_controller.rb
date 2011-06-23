class TweetersController < ApplicationController
  def index
    @tweeters = Tweeter.all
  end

end
