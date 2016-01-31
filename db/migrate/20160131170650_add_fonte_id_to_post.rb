class AddFonteIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :fonte_id, :integer
  end
end
