class Tweeter < ActiveRecord::Base
  has_many :tweets
  before_create :add_profile_image
  after_create :add_tweets

  
  validates_presence_of :screen_name, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :screen_name, :on => :create, :message => "must be unique"
  
  def tweeter_detail
    TweeterDetail.where(:tweeter_id => self.id)
  end
  
  def get_tweets
    if self.tweets.blank?
      tweets_array = Twitter.user_timeline(self.screen_name, :trim_user => true)
    else
      tweets_array = Twitter.user_timeline(self.screen_name, :trim_user => true, 
      :since_id => self.tweets.last.tweet_id.to_i)
    end
    
    tweets_array.each do |tweet|
      self.tweets.create(:message => tweet.text, :tweet_id => tweet.id_str, :tweet_time => tweet.created_at)
    end
    self.delay(:run_at => 20.minutes.from_now).get_tweets
  end

  def add_profile_image
    self.profile_image_url = Twitter.user(self.screen_name).profile_image_url
  end
  
  def add_tweets
    self.get_tweets
  end
  
end
