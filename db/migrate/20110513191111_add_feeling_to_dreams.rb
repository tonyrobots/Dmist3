class AddFeelingToDreams < ActiveRecord::Migration
  def self.up
    add_column :dreams, :feeling, :integer, :default => 3
  end

  def self.down
    remove_column :dreams, :feeling
  end
end
