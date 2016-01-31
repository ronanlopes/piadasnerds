class RemoveLikesCouCountFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :likes_cou_count, :integer
  end
end
