class Tweeter < ActiveRecord::Base
  has_many :tweets
  
  validates_presence_of :screen_name, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :screen_name, :on => :create, :message => "must be unique"
end
