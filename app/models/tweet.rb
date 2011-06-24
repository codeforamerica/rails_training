class Tweet < ActiveRecord::Base
  belongs_to :tweeter
  default_scope :order => 'created_at DESC'
  
  validates_presence_of :tweet_time, :on => :create, :message => "can't be blank"
  validates_presence_of :tweeter_id, :on => :create, :message => "can't be blank"
  validates_presence_of :message, :on => :create, :message => "can't be blank"
  

end
