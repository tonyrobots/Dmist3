class RenameHiddenToPrivate < ActiveRecord::Migration
  def self.up
    change_table :dreams do |t|
        t.remove :hidden
        t.boolean :private, :default => FALSE
     end
  end

  def self.down
    change_table :dreams do |t|
      t.remove :private
      t.boolean :hidden
    end
  end
end
