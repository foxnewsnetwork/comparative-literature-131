class CreateLayers < ActiveRecord::Migration
  def self.up
    create_table :layers do |t|
      t.integer :koma_id
      t.integer :picture_id
      t.integer :stack_number

      t.timestamps
    end
  end

  def self.down
    drop_table :layers
  end
end
