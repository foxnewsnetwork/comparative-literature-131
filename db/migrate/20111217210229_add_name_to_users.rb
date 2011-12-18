class AddNameToUsers < ActiveRecord::Migration
  def self.up
  	add_column :users, :name, :string
  	add_index :users, :name, :unique => true
  end

  def self.down
  	remove_index :users, :name
  	remove_column :users, :name
  end
end
