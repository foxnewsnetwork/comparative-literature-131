class AddCollaboratorToCollaboration < ActiveRecord::Migration
  def self.up
  	add_column :collaborations, :collaborator_id, :integer
  end

  def self.down
  	remove_column :collaborations, :collaborator_id
  end
end
