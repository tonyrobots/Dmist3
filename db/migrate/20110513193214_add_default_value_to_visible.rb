class AddDefaultValueToVisible < ActiveRecord::Migration
  def self.up
    change_column_default(:dreams, :visible, true)
  end

  def self.down
    change_column :dreams, :visible, :boolean
  end
end
