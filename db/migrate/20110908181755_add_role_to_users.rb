class AddRoleToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :role, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :users, :role
  end
end
