class Tweeter < ActiveRecord::Base
  validates_presence_of :screen_name, :on => :create, :message => "can't be blank"
end
