class AddIndexToObsessionsAndRelationships < ActiveRecord::Migration
  def self.up
  	add_index :relationships, [:follower_id, :followed_id], :unique => true
  	add_index :obsessions, [:stalker_id, :stalked_id], :unique => true
  end

  def self.down
  	remove_index :relationships, [:follower_id, :followed_id]
  	remove_index :obsessions, [:stalker_id, :stalked_id]
  end
end
