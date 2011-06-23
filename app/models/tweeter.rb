class Tweeter < ActiveRecord::Base
  has_many :tweets
  before_create :add_profile_image
  
  validates_presence_of :screen_name, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :screen_name, :on => :create, :message => "must be unique"
  
  def add_profile_image
    self.profile_image_url = Twitter.user(self.screen_name).profile_image_url
  end
  
end
