class CreateDreams < ActiveRecord::Migration
  def self.up
    create_table :dreams do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.date :date
      t.boolean :visible
      t.boolean :explicit
      t.boolean :hidden
      t.string :location

      t.timestamps
    end
  end

  def self.down
    drop_table :dreams
  end
end
