class AddAvatarRemoteUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar_remote_url, :string
  end
end
