class CreateKomas < ActiveRecord::Migration
  def self.up
    create_table :komas do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :komas
  end
end
