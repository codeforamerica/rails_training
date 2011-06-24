class AddTweetTimeToTweets < ActiveRecord::Migration
  def self.up
    add_column :tweets, :tweet_time, :datetime
  end

  def self.down
    remove_column :tweets, :tweet_time
  end
end