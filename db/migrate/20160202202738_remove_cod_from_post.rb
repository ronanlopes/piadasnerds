class RemoveCodFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :cod, :string
  end
end
