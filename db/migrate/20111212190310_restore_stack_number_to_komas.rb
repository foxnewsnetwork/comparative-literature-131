class RestoreStackNumberToKomas < ActiveRecord::Migration
  def self.up
  	add_column :layers, :stack_number, :integer, :default => 0
  	remove_column :layers, :layer_before
  	remove_column :layers, :layer_after
  	
  	add_index :layers, [ :koma_id, :stack_number], :unique => true
  end

  def self.down
  	remove_column :layers, :stack_number
  	add_column :layers, :layer_before, :integer
  	add_column :layers, :layer_after, :integer
  	
  	remove_index :layers, [:koma_id, :stack_number]
  end
end
