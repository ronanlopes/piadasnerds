class AddIdsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :facebook_id, :string
    add_column :posts, :twitter_id, :string
    add_column :posts, :instagram_id, :string
  end
end
