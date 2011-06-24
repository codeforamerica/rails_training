class TweeterDetail
  include MongoMapper::Document

  def tweeter
    Tweeter.where(:id => self.tweeter_id)
  end
  
end