class AddSizeToLayers < ActiveRecord::Migration
  def self.up
  	add_column :layers, :width, :integer
  	add_column :layers, :height, :integer
  end

  def self.down
  	remove_column :layers, :width
  	remove_column :layers, :height
  end
end
