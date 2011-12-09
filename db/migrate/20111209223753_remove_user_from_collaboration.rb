class RemoveUserFromCollaboration < ActiveRecord::Migration
  def self.up
  	remove_column :collaborations, :user_id
  end

  def self.down
  	add_column :collaborations, :user_id, :integer
  end
end
