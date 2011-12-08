class CreateChapters < ActiveRecord::Migration
  def self.up
    create_table :chapters do |t|
      t.integer :manga_id
      t.string :title
      t.integer :chapter_number
      t.integer :chapter_before
      t.integer :chapter_after

      t.timestamps
    end
  end

  def self.down
    drop_table :chapters
  end
end
