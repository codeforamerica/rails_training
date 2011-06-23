class AddProfileImageToTweeters < ActiveRecord::Migration
  def self.up
    add_column :tweeters, :profile_image_url, :string
  end

  def self.down
    remove_column :tweeters, :profile_image_url
  end
end