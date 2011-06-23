class Tweeter < ActiveRecord::Base
  has_many :tweets
  before_create :add_profile_image
  
  validates_presence_of :screen_name, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :screen_name, :on => :create, :message => "must be unique"
  
  def get_tweets
    tweets_array = Twitter.user_timeline(self.screen_name, :trim_user => true)
    tweets_array.each do |tweet|
      self.tweets.create(:message => tweet.text)
    end
  end

  def add_profile_image
    self.profile_image_url = Twitter.user(self.screen_name).profile_image_url
  end
  
end
