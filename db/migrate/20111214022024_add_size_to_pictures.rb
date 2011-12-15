class AddSizeToPictures < ActiveRecord::Migration
  def self.up
  	remove_column :layers, :width
  	remove_column :layers, :height
  	
  	add_column :pictures, :width, :integer
  	add_column :pictures, :height, :integer
  end

  def self.down
  	remove_column :pictures, :width
  	remove_column :pictures, :height
  	
  	add_column :layers, :width, :integer
  	add_column :layers, :height, :integer
  end
end
