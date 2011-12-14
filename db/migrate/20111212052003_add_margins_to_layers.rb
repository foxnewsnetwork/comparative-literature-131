class AddMarginsToLayers < ActiveRecord::Migration
  def self.up
  	add_column :layers, :margin_left, :integer
  	add_column :layers, :margin_right, :integer
  	add_column :layers, :margin_up, :integer
  	add_column :layers, :margin_down, :integer
  end

  def self.down
  	remove_column :layers, :margin_left
  	remove_column :layers, :margin_right, :integer
  	remove_column :layers, :margin_up, :integer
  	remove_column :layers, :margin_down, :integer
  end
end
