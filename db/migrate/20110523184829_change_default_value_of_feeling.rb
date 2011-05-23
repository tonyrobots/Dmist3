class ChangeDefaultValueOfFeeling < ActiveRecord::Migration
  def self.up
    change_column_default(:dreams, :feeling, 50)
  end

  def self.down
    change_column_default(:dreams, :feeling, 3)
  end
end
