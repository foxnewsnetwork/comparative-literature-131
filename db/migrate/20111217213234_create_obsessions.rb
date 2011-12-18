class CreateObsessions < ActiveRecord::Migration
  def self.up
    create_table :obsessions do |t|
      t.integer :stalker_id
      t.integer :stalked_id

      t.timestamps
    end
  end

  def self.down
    drop_table :obsessions
  end
end
