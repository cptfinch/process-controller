class AddLftAndRgtToPrcesses < ActiveRecord::Migration
  def self.up
    add_column :prcesses, :lft, :integer
    add_column :prcesses, :rgt, :integer
  end

  def self.down
    remove_column :prcesses, :rgt
    remove_column :prcesses, :lft
  end
end
