class AddIndexAndAdminToUserStuff < ActiveRecord::Migration
  def self.up
  	add_index :obsessions, :stalked_id
  	add_index :obsessions, :stalker_id
  	add_index :relationships, :followed_id
  	add_index :relationships, :follower_id
  	
  	add_column :users, :user_level, :integer, :default => 0
  end

  def self.down
	remove_index :obsessions, :stalked_id
	remove_index :obsessions, :stalker_id
	remove_index :relationships, :followed_id
	remove_index :relationships, :follower_id
	
	remove_column :users, :user_level
  end
end
