class AddTweetIdToTweets < ActiveRecord::Migration
  def self.up
    add_column :tweets, :tweet_id, :string
  end

  def self.down
    remove_column :tweets, :tweet_id
  end
end