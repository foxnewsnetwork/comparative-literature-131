class CreateKomas < ActiveRecord::Migration
  def self.up
    create_table :komas do |t|
    	t.integer :chapter_id

      t.timestamps
    end
  end

  def self.down
    drop_table :komas
  end
end
