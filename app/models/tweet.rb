class Tweet < ActiveRecord::Base
  belongs_to :tweeter
  
  validates_presence_of :message, :on => :create, :message => "can't be blank"
end
