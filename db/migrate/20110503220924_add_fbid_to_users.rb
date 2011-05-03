class AddFbidToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :fbid, :integer
  end

  def self.down
    remove_column :users, :fbid
  end
end
