class ChangeFbidTypeInUsers < ActiveRecord::Migration
  def up
    change_column :users, :fbid, :bigint
  end

  def down
    change_column :users, :fbid, :integer
  end
end
