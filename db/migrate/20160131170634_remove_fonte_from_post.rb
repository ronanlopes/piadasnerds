class RemoveFonteFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :fonte, :string
  end
end
