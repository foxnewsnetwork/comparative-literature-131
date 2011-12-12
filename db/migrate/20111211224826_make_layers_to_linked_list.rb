class MakeLayersToLinkedList < ActiveRecord::Migration
  def self.up
  	add_column :layers, :layer_before, :integer
  	add_column :layers, :layer_after, :integer
  	remove_column :layers, :stack_number
  end

  def self.down
  	remove_column :layers, :layer_before
  	remove_column :layers, :layer_after
  	add_column :layers, :stack_number, :integer
  end
end
