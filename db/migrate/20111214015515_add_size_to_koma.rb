class AddSizeToKoma < ActiveRecord::Migration
  def self.up
  	add_column :komas, :width, :integer
  	add_column :komas, :height, :integer
  end

  def self.down
  	remove_column :komas, :width
  	remove_column :komas, :height
  end
end
