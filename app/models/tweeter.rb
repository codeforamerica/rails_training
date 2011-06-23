class Tweeter < ActiveRecord::Base
  validates_presence_of :screen_name, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :screen_name, :on => :create, :message => "must be unique"
end
