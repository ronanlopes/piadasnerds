class AddOtherColumnsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :likes_cou_count, :integer
    add_column :posts, :shares_count, :integer
  end
end
