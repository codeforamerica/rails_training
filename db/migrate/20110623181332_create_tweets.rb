class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.integer :tweeter_id
      t.string :message

      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
