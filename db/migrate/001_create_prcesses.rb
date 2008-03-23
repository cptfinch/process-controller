class CreatePrcesses < ActiveRecord::Migration
  def self.up
    create_table :prcesses do |t|
      t.string :name
      t.integer :parent_id
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :prcesses
  end
end
