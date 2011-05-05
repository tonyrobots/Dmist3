class ChangeCommentCommentToBody < ActiveRecord::Migration
  def self.up
     change_table :comments do |t|
        t.rename :comment, :body
     end
  end

  def self.down
     change_table :comments do |t|
        t.rename  :body, :comment
     end
  end
end
