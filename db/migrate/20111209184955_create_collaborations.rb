class CreateCollaborations < ActiveRecord::Migration
  def self.up
    create_table :collaborations do |t|
      t.integer :manga_id
      t.integer :user_id
      t.string :rank

      t.timestamps
    end
  end

  def self.down
    drop_table :collaborations
  end
end
