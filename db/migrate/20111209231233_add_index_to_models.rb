class AddIndexToModels < ActiveRecord::Migration
  def self.up
  	add_index :layers, :koma_id
  	add_index :layers, :picture_id
  	add_index :layers, [:koma_id, :picture_id], :unique => true
  	
  	add_index :collaborations, :collaborator_id
  	add_index :collaborations, :manga_id
  	add_index :collaborations, [:collaborator_id, :manga_id], :unique => true
  	
  	add_index :chapters, :chapter_number
  	add_index :chapters, :manga_id
  	
  	add_index :komas, :chapter_id
  	
  	add_index :mangas, :user_id
  	
  	add_index :pictures, :user_id
  	

  end

  def self.down
  	remove_index :layers, :koma_id
  	remove_index :layers, :picture_id
  	remove_index :layers, [:koma_id, :picture_id]
  	
  	remove_index :collaborations, :collaborator_id
		remove_index :collaborations, :manga_id
		remove_index :collaborations, [:collaborator_id, :manga_id], :unique => true
		
  	remove_index :chapters, :chapter_number
  	remove_index :chapters, :manga_id
  	
  	remove_index :komas, :chapter_id
  	
  	remove_index :mangs, :user_id
  	
  	remove_index :pictures, :user_id
  end
end
